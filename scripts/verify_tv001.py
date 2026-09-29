#!/usr/bin/env python3
"""Static TV001 gate. Does not instantiate Max objects or verify MSP/runtime."""
import argparse
import json
import math
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
ALPHA = ROOT / 'patches/flode_alpha_01'
BASE = '2aa596dafd5b0881740cfadc32969197892a4a35'

def boxes(p):
    return {x['box']['id']: x['box'] for x in p['boxes']}

def edges(p):
    return {(tuple(x['patchline']['source']), tuple(x['patchline']['destination'])) for x in p['lines']}

def edge(p, a, b, ao=0, bi=0):
    assert ((a, ao), (b, bi)) in edges(p), (a, ao, b, bi)

def walk(p):
    yield p
    for b in boxes(p).values():
        if 'patcher' in b:
            yield from walk(b['patcher'])

def reaches(p, start, end):
    seen = set()
    todo = [start]
    while todo:
        node = todo.pop()
        if node == end:
            return True
        if node not in seen:
            seen.add(node)
            todo += [dst[0] for src, dst in edges(p) if src[0] == node]
    return False

def scalar_model(p, values):
    """Evaluate patch predicate with Python floats, NOT Max message dispatch."""
    b = boxes(p)
    if len(values) != 1:
        return False
    value = values[0]
    types = (int,) if b['type']['text'] == 'route int' else (int, float)
    if type(value) not in types:
        return False
    expr = b['predicate']['text'][5:].replace('$i1', 'value').replace('$f1', 'value')
    expr = expr.replace('&&', ' and ').replace('||', ' or ')
    assert re.fullmatch(r'[a-z0-9_ .()<>!=+\-*/&|]+', expr)
    return bool(eval(expr, {'__builtins__': {}}, {'value': value}))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--part', choices=['A', 'B'], required=True)
    part = parser.parse_args().part
    top = json.loads((ALPHA / 'patchers/flode_alpha_01.maxpat').read_text())['patcher']
    pod = json.loads((ALPHA / 'patchers/flode_pod_v01.maxpat').read_text())['patcher']
    for p in [top, *walk(pod)]:
        b = boxes(p)
        assert len(b) == len(p['boxes']), 'duplicate ID'
        for src, dst in edges(p):
            assert src[0] in b and dst[0] in b and src[1] >= 0 and dst[1] >= 0
            for id, port, direction in [(src[0],src[1],'outlet'),(dst[0],dst[1],'inlet')]:
                if 'patcher' in b[id]:
                    count=sum(x['maxclass']==direction for x in boxes(b[id]['patcher']).values())
                    assert port < count, (id, direction, port, count)
    proj = json.loads((ALPHA / 'flode_alpha_01.maxproj').read_text())
    assert all((ALPHA/'patchers'/name).is_file() for name in proj['contents']['patchers'])
    assert not (ALPHA/'patchers/flode_alpha_01.maxproj').exists()
    b=boxes(pod); c=b['controls']['patcher']; cb=boxes(c); e=b['event']['patcher']; eb=boxes(e); s=b['safety']['patcher']
    assert b['state']['text']=='dict #1.pod.#2.state @embed 0'
    for key in ['api_version','pod_id','sample_path','sample_loaded','gain','pan','base_rate','jung_enabled','seed','slice_count','debug_enabled']:
        assert key in b['defaults']['text']
    edge(pod,'state_write','state',1); edge(pod,'state_write','state')
    edge(pod,'state','read_state'); edge(pod,'read_state','state_values',1)
    checks={'gain':[([-1.],True),([2.],True),(['oops'],False),([float('nan')],False),([float('inf')],False),([],False),([1.,2.],False)],
            'api_version':[([1],True),([2],False),([1.],False)],
            'base_rate':[([1.],True),([0.],False),([-1.],False),([float('inf')],False)],
            'jung_enabled':[([0],True),([1],False)],
            'slice_count':[([16],True),([0],False),([1.5],False)],
            'debug_enabled':[([0],True),([1],True),([2],False)]}
    n=0
    for name, cases in checks.items():
        validator=cb[name+'_check']['patcher']
        edge(validator,'arity','len',1); edge(validator,'arity','gate',0,1)
        for values, expected in cases:
            assert scalar_model(validator,values)==expected,(name,values)
            n+=1
        assert reaches(c,name+'_error','error')
    assert cb['gain_clip']['text']=='clip 0. 1.' and cb['pan_clip']['text']=='clip -1. 1.'
    assert 'sample_loaded' not in cb['route']['text']
    edge(pod,'obj-6','completion',1); edge(pod,'completion','reset_metadata',2); edge(pod,'completion','info',1)
    edge(pod,'info','length',6,1); edge(pod,'info','channels',8,1); edge(pod,'info','sample_rate',0,1)
    edge(pod,'availability','loaded_order'); edge(pod,'loaded_order','loaded'); edge(pod,'loaded','state_write')
    assert reaches(pod,'load_order','invalidate_state') and reaches(pod,'physical_load','empty_buffer')
    assert b['empty_buffer']['text']=='sizeinsamps 0'
    edge(pod,'state_values','diag_gate',2); edge(pod,'controls','diag_gate',1,1)
    edge(top,'pod_diag_route','transport_diag_gate'); edge(top,'transport_diag_gate','obj-15')
    assert eb['arity_ok']['text']=='== 11'
    for i in [1,2,4,6,7,8,9,10,11]:
        edge(e,'check_'+str(i),'bad',1)
    for i, tests in {1:[([2],False)],7:[([0.],False),([float('nan')],False)],8:[([-12.],True),([12.],True),([13.],False)],9:[([1],True),([3],True),([4],False)],10:[([0],True),([1],True),([2],False)]}.items():
        for vals,expected in tests:
            assert scalar_model(eb['check_'+str(i)]['patcher'],vals)==expected
            n+=1
    assert len([x for x in eb.values() if x['maxclass']=='outlet'])==1
    edge(e,'unsupported','rejected'); edge(e,'malformed','rejected')
    edge(pod,'event','error_order'); edge(pod,'controls','error_order',3)
    edge(pod,'error_order','stop_request',1); edge(pod,'stop_request','safety')
    assert reaches(pod,'safe_action','groove_stop') and reaches(pod,'safe_action','stop_rate')
    assert boxes(s)['release']['text']=='0. 10'
    edge(s,'amp','completion_gate',1,1)
    edge(pod,'obj-9','amp_left'); edge(pod,'obj-9','amp_right',1)
    if part=='A':
        edge(pod,'safety','amp_left',0,1); edge(pod,'safety','amp_right',0,1)
    else:
        edge(pod,'safety','playback_amplitude'); edge(pod,'end_taper','playback_amplitude',0,1)
        edge(pod,'playback_amplitude','amp_left',0,1); edge(pod,'playback_amplitude','amp_right',0,1)
    edge(pod,'amp_left','obj-21'); edge(pod,'amp_right','obj-22')
    original=json.loads(subprocess.check_output(['git','show',BASE+':patches/flode_alpha_01/patchers/flode_alpha_01.maxpat'],cwd=ROOT))['patcher']
    tb=boxes(top)
    clock_ids={'obj-3','obj-4','obj-6','obj-7','obj-8','obj-10','obj-11','obj-12','obj-20','obj-16'}
    for id in clock_ids:
        assert tb[id].get('text')==boxes(original)[id].get('text')
    for src,dst in edges(original):
        if src[0] in clock_ids and dst[0] in clock_ids: assert (src,dst) in edges(top)
    all_objects=[x.get('text','').split(' ')[0] for p in [top,*walk(pod)] for x in boxes(p).values() if x['maxclass']=='newobj']
    for forbidden in ['js','v8','node.script','random','drunk','urn','sfrecord~','record~','mc.mixdown~','limiter~']:
        assert forbidden not in all_objects,forbidden
    assert all_objects.count('transport')==1 and all_objects.count('metro')==1
    if part=='A':
        assert [src for src,dst in edges(pod) if dst==('obj-8',0)]==[('stop_rate',0)]
        assert 'attack' not in boxes(s) and 'play' not in cb['route']['text'].split()
        assert 'target/planned' in (ROOT/'design/POD_A_UI-R&D.md').read_text()
    else:
        assert 'play' in cb['route']['text'].split() and 'retrigger' in cb['route']['text'].split()
        assert boxes(s)['attack']['text']=='1. 10'
        assert reaches(pod,'start_valid','obj-8') and reaches(pod,'start_valid','obj-9')
        assert b['obj-9']['text'].endswith('@loop 0')
        assert cb['apache_path']['text']=='symbol "Project:/media/Apache Break ( Driven Silk Red ).wav"'
        edge(c,'apache_path','project_absolute'); edge(c,'project_absolute','load')
        edge(pod,'play_request','state',1); edge(pod,'state','play_state')
        edge(pod,'play_state','play_rate',1,1); edge(pod,'play_state','play_end',2,1)
        edge(pod,'start_valid','position_zero',1); edge(pod,'position_zero','obj-9')
        edge(pod,'start_valid','play_rate',2); edge(pod,'play_rate','obj-8')
        edge(pod,'play_end','obj-9',0,2); assert b['full_start']['text']=='0.'
        edge(pod,'start_valid','safety',0,1); edge(s,'attack','amp')
        edge(pod,'safety','play_dsp_check',2,1)
        edge(top,'obj-8','run_to_playback'); edge(top,'pod_play','obj-16'); edge(top,'pod_stop','obj-16')
        assert 'loop 1' not in [x.get('text','') for p in walk(pod) for x in boxes(p).values()]
    print(f'PASS: Part {part} static graph/contracts; {n} predicate-model cases. UNVERIFIED IN MAX RUNTIME.')

if __name__=='__main__':
    main()
