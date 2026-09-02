# Claude Code: regole di progetto

Template base per progetti universitari (web, mobile, Python). `scripts/new-project.sh` lo copia in ogni nuovo progetto.

## Primo avvio in un nuovo progetto

1. Esegui `/setup-matt-pocock-skills` scegliendo il tracker locale (`.scratch/`): configura issue tracker e layout di `CONTEXT.md` e `docs/adr/`.
2. Sostituisci gli script placeholder di `package.json` con i comandi reali di build, test e lint del progetto.

## Continuità tra sessioni

- Inizio conversazione: leggi `backup/SUMMARY.md` prima di ogni altra cosa.
- Fine attività: aggiungi a `backup/SUMMARY.md` una voce `## [YYYY-MM-DD HH:MM] titolo` con 2-3 frasi. Mantieni solo le ultime 30 voci.

## Linguaggio del dominio

- `CONTEXT.md` è il glossario del progetto. Usa i suoi termini nel codice, nei test e nelle risposte. Quando un termine si chiarisce, aggiornalo subito (skill `domain-modeling`).
- `docs/adr/` raccoglie le decisioni difficili da invertire. Rispetta gli ADR dell'area che tocchi.

## Come lavorare

- Fai esattamente quanto chiesto. Modifica i file esistenti; crea file nuovi solo quando servono al risultato.
- Leggi un file per intero prima di modificarlo.
- Documentazione (`*.md`, README) solo su richiesta esplicita.
- Prima di dichiarare un lavoro finito: esegui i test e verifica che la build passi.

## Struttura cartelle

La root contiene solo configurazione, `CLAUDE.md` e `CONTEXT.md`. Tutto il resto va in:
`src/` codice · `tests/` test · `docs/` documentazione e ADR · `config/` configurazione · `scripts/` utility · `examples/` esempi.

## Qualità del codice

- File sotto 500 righe.
- Interfacce tipizzate per le API pubbliche.
- Input validato ai confini del sistema; percorsi file sanificati contro directory traversal.
- Il codice nuovo arriva con i suoi test.

## Sicurezza

Segreti e credenziali vivono solo in `.env` (non tracciato; template in `.env.example`) o in variabili d'ambiente. Il codice li legge dall'ambiente.

## Claude Flow (opzionale)

MCP `claude-flow` configurato in `.mcp.json`. Serve al coordinamento (swarm init, memory); l'esecuzione (agenti, file, git) resta al tool Agent. Diagnostica: `npx @claude-flow/cli@latest doctor --fix`.
