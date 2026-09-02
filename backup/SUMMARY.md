# Session History

<!-- Format: ## [YYYY-MM-DD HH:MM] [title]\n<2-3 sentence summary> -->
<!-- Keep last 30 entries only -->

## [2026-09-03 01:40] Valutazione repo mattpocock/skills
Analizzata https://github.com/mattpocock/skills (25 skill di processo: grilling, tdd, diagnosing-bugs, code-review 2 assi, to-spec/to-tickets/implement, writing-for-agents, CONTEXT.md+ADR). Verdetto: non sostituisce il template (copre solo processo, non design/linguaggi/MCP), ma va installato come plugin globale e usato per potare il setup (CLAUDE.md 20KB, 735 file, sovrapposizioni con superpowers). Nessuna modifica applicata.

## [2026-09-03 01:55] Adozione mattpocock-skills e snellimento template
Installato plugin `mattpocock-skills@claude-plugins-official` (scope user, v1.2.3). CLAUDE.md riscritto da 20KB a 2.2KB (copia precedente in backup/CLAUDE.md.pre-2026-09-03), indice skill rimosso. Aggiunti CONTEXT.md template e docs/adr/, `*.pdf` in .gitignore, new-project.sh copia i nuovi file e suggerisce /setup-matt-pocock-skills. Nulla committato.
