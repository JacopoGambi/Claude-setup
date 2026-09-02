# Claude Code: regole di progetto

Template base per progetti universitari (web, mobile, Python). `scripts/new-project.sh` lo copia in ogni nuovo progetto.

## Primo avvio in un nuovo progetto

1. Sostituisci gli script placeholder di `package.json` con i comandi reali di build, test e lint del progetto.
2. Le skill di ingegneria sono già configurate (sezione "Agent skills"). Esegui `/setup-matt-pocock-skills` solo per passare da tracker locale a GitHub Issues.

## Continuità tra sessioni

- Inizio conversazione: leggi `backup/SUMMARY.md` prima di ogni altra cosa.
- Fine attività: aggiungi a `backup/SUMMARY.md` una voce `## [YYYY-MM-DD HH:MM] titolo` con 2-3 frasi. Mantieni solo le ultime 30 voci.

## Agent skills

### Issue tracker
Issue e spec vivono come file markdown in `.scratch/<feature>/` (tracker locale). See `docs/agents/issue-tracker.md`.

### Triage labels
Le cinque label canoniche (`needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`) usate così come sono. See `docs/agents/triage-labels.md`.

### Domain docs
Single-context: `CONTEXT.md` (glossario, usa i suoi termini nel codice, nei test e nelle risposte) e `docs/adr/` (decisioni difficili da invertire) alla root. See `docs/agents/domain.md`.

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
