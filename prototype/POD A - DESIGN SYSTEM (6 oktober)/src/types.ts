export type SemanticState="idle"|"active"|"disabled"|"selected"|"focused"|"dragging";
export type PodId="A"|"B"|"C"|"D"|"E"|"F";
export type GenMode="PURE"|"JUNG"|"WEIGHTED"|"WALK"|"MEMORY"|"CHAOS";
export interface Marker { id:string; positionNorm:number; label?:string }
export interface LoopRegion { startNorm:number; endNorm:number }
export interface WaveformData { peaks:ReadonlyArray<number> }
export interface PodState {
 id:PodId; sampleName:string|null; durationSeconds:number|null; bpm:number|null;
 isMuted:boolean; isSolo:boolean; volumeNorm:number; panNorm:number;
 loopRegion:LoopRegion; playbackPosNorm:number|null; genMode:GenMode;
 randomJungNorm:number; jitterNorm:number; eqLowNorm:number; eqMidNorm:number; eqHighNorm:number;
 speedMultiplier:number; isLoopActive:boolean; isSyncActive:boolean;
}
