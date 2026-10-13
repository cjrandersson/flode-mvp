# Komlåda · GitHub-protokoll v0.1

**Syfte:** Minsta möjliga tvåvägskommunikation i GitHub mellan projektägare, ChatGPT (samordning) och Codex (utveckling). Samma protokoll kan kopieras till andra repositoryn.

## Tre kommandon

| Kommando | Beteende | Implementation |
| --- | --- | --- |
| `/status` | Svara i samma issue/PR med läsbar och verifierbar GitHub-status; ändrar inte kod eller arbetsstatus | v0.1 (i denna PR) |
| `/go` | Godkänn redan avgränsat nästa arbete, efter kontroll av användarroll och scope | **Ej implementerat** |
| `/hold` | Markera att fortsatt arbete ska invänta beslut, efter kontroll av användarroll | **Ej implementerat** |

De två senare kommandona måste få explicita behörighetsregler innan de kopplas till någon åtgärd. Inget i denna PR väcker eller startar Codex automatiskt. En GitHub-kommentar kan inte i sig väcka ChatGPT i en pågående chatt.

## Hur /status fungerar

1. En människa skriver exakt `/status` i en GitHub-issue eller PR.
2. Efter aktivering reagerar `issue_comment`-workflowet från **default branch**. Kommandot kräver ingen särskild stavning utöver exakt `/status`.
3. Workflowet läser issue-/PR-status, branch och senaste commit. Om en kommentar innehåller en checkpoint med fälten nedan använder den detta som rapporterat arbetsläge.
4. GitHub Actions postar en kommentar. När checkpoint saknas redovisas information som **inte verifierad** – systemet gissar inte vad Codex har gjort.

Enbart en GitHub-kommentar och metadata är inte bevis på att realtidsljud eller andra acceptanskriterier har testats.

### Checkpoint-kontrakt (från Codex eller ansvarig utvecklare)

```text
BASELINE: branch + SHA + testfakta
CODEX PENDING: ett konkret nästa steg
CJ PENDING: beslut eller test, om något behövs
BLOCKED BY: verifierad blockerare, eller none
```

Första versionen läser högst de 100 första kommentarerna i tråden. Detta bör utökas med paginering om trådarna blir långa.

## Flöde~ konfiguration

`.github/komlada.json` innehåller en frivillig mappning mellan issue och branch. För flöde~ används Issue #9 → `cpp-pod-v0`. Om konfiguration saknas används repots default branch och issue-titel. Ingen POD/DSP-kod påverkas.

## Aktivering och test

- Granska den separata Komlåda-PR:en.
- Slå ihop den **efter granskning**, så workflow-filen finns på default branch; detta behövs för GitHubs `issue_comment`-trigger.
- Skriv `/status` i Issue #9 och kontrollera att GitHub Actions-boten svarar i samma tråd.
- Verifiera att botens branch och commit stämmer; kontrollera att en ny kommentar **inte** startar Codex eller ändrar projektkod.
- Om ingen kommentar kommer, kontrollera Actions-fliken och att Actions/tilldelade token-rättigheter är aktiverade i repot.

## Återanvändning

Kopiera `.github/workflows/komlada-status.yml` och valfritt `.github/komlada.json` till ett annat repo. Ändra endast projektets metadata och issue-/branchmappning. Dokumentationsfilen är också generell. Ingen särskild flöde~-kod krävs.
