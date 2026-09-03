# Session History

<!-- Format: ## [YYYY-MM-DD HH:MM] [title]\n<2-3 sentence summary> -->
<!-- Keep last 30 entries only -->

## [2026-09-03 01:40] Valutazione repo mattpocock/skills
Analizzata https://github.com/mattpocock/skills (25 skill di processo: grilling, tdd, diagnosing-bugs, code-review 2 assi, to-spec/to-tickets/implement, writing-for-agents, CONTEXT.md+ADR). Verdetto: non sostituisce il template (copre solo processo, non design/linguaggi/MCP), ma va installato come plugin globale e usato per potare il setup (CLAUDE.md 20KB, 735 file, sovrapposizioni con superpowers). Nessuna modifica applicata.

## [2026-09-03 01:55] Adozione mattpocock-skills e snellimento template
Installato plugin `mattpocock-skills@claude-plugins-official` (scope user, v1.2.3). CLAUDE.md riscritto da 20KB a 2.2KB (copia precedente in backup/CLAUDE.md.pre-2026-09-03), indice skill rimosso. Aggiunti CONTEXT.md template e docs/adr/, `*.pdf` in .gitignore, new-project.sh copia i nuovi file e suggerisce /setup-matt-pocock-skills. Nulla committato.

## [2026-09-03 02:10] Setup mattpocock-skills nel template
Eseguito a mano /setup-matt-pocock-skills (skill non caricata in sessione): tracker locale `.scratch/`, label triage default, single-context. Scritti docs/agents/{issue-tracker,domain,triage-labels}.md; CLAUDE.md ha blocco `## Agent skills` al posto di "Linguaggio del dominio"; new-project.sh copia docs/agents/. Non committato.

## [2026-09-03 02:45] Pulizia template (punti 1,3,4,5)
settings.json spostato in .claude/settings.json (ora attivo: deny .env, permessi claude-flow); settings.local.json rimosso dal tracking e in .gitignore. Eliminate 14 cartelle superpowers vuote e frontend-design (duplicato del plugin); skill github-* mantenute (vengono da claude-flow, non dal plugin github). 25 skill rinominate da `skills<nome>` a `<nome>` reale. new-project.sh ora copia package.json. Nulla committato.
