# Claude Code Configuration

## Behavioral Rules

- Do what has been asked; nothing more, nothing less
- NEVER create files unless absolutely necessary
- ALWAYS prefer editing an existing file to creating a new one
- NEVER proactively create documentation files (*.md) or README files unless explicitly requested
- NEVER save working files, text/mds, or tests to the root folder
- ALWAYS read a file before editing it
- NEVER commit secrets, credentials, or .env files

## Context & Continuity

- **Start of conversation**: ALWAYS read `backup/SUMMARY.md` before doing anything else, to reconstruct context from previous sessions.
- **End of task**: Update `backup/SUMMARY.md` with a concise entry for what was done. Format: `## [YYYY-MM-DD HH:MM] [title]\n<2-3 sentence summary>`. Keep only the last 30 entries.
- **New libraries**: Before using any new library or framework, consult Context7 for up-to-date documentation.

## File Organization

- NEVER save to root folder — use the directories below:
  - `/src` — source code
  - `/tests` — test files
  - `/docs` — documentation
  - `/config` — configuration files
  - `/scripts` — utility scripts
  - `/examples` — example code

## Code Quality

- Keep files under 500 lines
- Use typed interfaces for public APIs
- Validate input at system boundaries
- Write tests for new code

## Build & Test

```bash
npm run build    # Build
npm test         # Test
npm run lint     # Lint
```

- ALWAYS run tests after making code changes
- ALWAYS verify build succeeds before committing

## Security

- NEVER hardcode API keys, secrets, or credentials in source files
- NEVER commit .env files or any file containing secrets
- Validate user input at system boundaries
- Sanitize file paths to prevent directory traversal

## Efficiency

- Batch related operations in a single message (parallel reads, writes, commands)
- When spawning agents, put ALL agent calls in ONE message with `run_in_background: true`
- After spawning agents, STOP — do NOT poll status, wait for results

## Skills & Agents Index

> Tutti invocabili via `Skill("nome")` o `Skill("prefisso:nome")`. Fonti: **SP**=superpowers, **CF**=claude-flow, **BI**=built-in, **PL**=plugin, **ECC**=everything-claude-code.

### ECC Agenti (`~/.claude/agents/`) — invocare via Agent tool
| Agente | Uso |
|--------|-----|
| `architect` | Architettura sistema, scalabilità, decisioni tecniche |
| `planner` | Pianificazione feature complesse e refactoring |
| `tdd-guide` | TDD: enforcing write-tests-first |
| `security-reviewer` | Rilevamento vulnerabilità e remediation |
| `performance-optimizer` | Analisi performance e bottleneck |
| `refactor-cleaner` | Dead code cleanup e consolidamento |
| `doc-updater` | Aggiornamento documentazione e codemaps |
| `docs-lookup` | Ricerca documentazione API via Context7 |
| `loop-operator` | Monitoring e gestione agent loop autonomi |
| `harness-optimizer` | Ottimizzazione configurazione agent harness |
| `code-reviewer` *(superpowers)* | Review implementazioni vs piano |
| **Language Reviewers** | |
| `python-reviewer` | Python (PEP8, type hints, security) |
| `typescript-reviewer` | TypeScript/JavaScript |
| `go-reviewer` | Go idioms e best practice |
| `rust-reviewer` | Rust ownership e patterns |
| `java-reviewer` | Java e Spring Boot |
| `kotlin-reviewer` | Kotlin/Android/KMP |
| `cpp-reviewer` | C++ modern |
| `flutter-reviewer` | Flutter e Dart |
| `database-reviewer` | PostgreSQL/Supabase schema e query |
| `healthcare-reviewer` | Clinical safety, PHI compliance |
| **Build Resolvers** | |
| `build-error-resolver` | Build/TypeScript errors (minimal diffs) |
| `go-build-resolver` | Go build failures e vet warnings |
| `rust-build-resolver` | Rust build e borrow checker |
| `java-build-resolver` | Maven/Gradle build failures |
| `kotlin-build-resolver` | Kotlin/Gradle compiler errors |
| `cpp-build-resolver` | CMake e linker problems |
| `pytorch-build-resolver` | PyTorch/CUDA training errors |
| **Specialized** | |
| `e2e-runner` | E2E testing Playwright/Vercel |
| `chief-of-staff` | Triage email/Slack/comunicazioni |

### ECC Slash Commands (`/cmd`) — fonte: `~/.claude/commands/`
**Workflow:** `/plan` · `/tdd` · `/verify` · `/build-fix` · `/quality-gate`
**Session:** `/save-session` · `/resume-session` · `/sessions` · `/checkpoint` · `/aside`
**Review:** `/python-review` · `/go-review` · `/rust-review` · `/cpp-review` · `/kotlin-review`
**Build Fix:** `/go-build` · `/rust-build` · `/cpp-build` · `/kotlin-build` · `/gradle-build`
**Test:** `/e2e` · `/go-test` · `/rust-test` · `/cpp-test` · `/kotlin-test` · `/test-coverage`
**Multi-Agent:** `/multi-plan` · `/multi-workflow` · `/orchestrate` · `/devfleet` · `/multi-backend` · `/multi-frontend`
**Loop:** `/loop-start` · `/loop-status` · `/claw`
**Learning:** `/learn` · `/learn-eval` · `/evolve` · `/skill-create` · `/skill-health` · `/rules-distill`
**Refactor:** `/refactor-clean` · `/prompt-optimize` · `/prune`
**Docs:** `/update-docs` · `/update-codemaps`
**Project:** `/projects` · `/eval` · `/harness-audit` · `/model-route` · `/pm2` · `/setup-pm`
**Misc:** `/context-budget` · `/promote` · `/instinct-export` · `/instinct-import` · `/instinct-status`

### ECC Skills per Linguaggio/Framework (`~/.claude/skills/`)
**Backend:** `python-patterns` · `python-testing` · `golang-patterns` · `golang-testing` · `rust-patterns` · `rust-testing` · `java-coding-standards` · `jpa-patterns` · `springboot-patterns` · `springboot-tdd` · `springboot-security` · `springboot-verification`
**Kotlin:** `kotlin-patterns` · `kotlin-testing` · `kotlin-coroutines-flows` · `kotlin-exposed-patterns` · `kotlin-ktor-patterns` · `compose-multiplatform-patterns`
**PHP/Laravel/Django:** `laravel-patterns` · `laravel-tdd` · `laravel-security` · `laravel-verification` · `laravel-plugin-discovery` · `django-patterns` · `django-tdd` · `django-security` · `django-verification`
**C++:** `cpp-coding-standards` · `cpp-testing`
**Frontend:** `frontend-patterns` · `frontend-slides` · `nextjs-turbopack` · `nuxt4-patterns` · `swiftui-patterns` · `liquid-glass-design` · `design-system`
**Swift:** `swift-concurrency-6-2` · `swift-actor-persistence` · `swift-protocol-di-testing`
**Mobile:** `android-clean-architecture` · `flutter-dart-code-review` · `pytorch-patterns`
**Infra:** `docker-patterns` · `deployment-patterns` · `database-migrations` · `postgres-patterns` · `git-workflow` · `bun-runtime` · `clickhouse-io`
**Testing:** `tdd-workflow` · `e2e-testing` · `ai-regression-testing` · `browser-qa` · `benchmark`
**Security:** `security-review` · `security-scan` · `safety-guard` · `django-security` · `perl-security`
**AI/Agent:** `agentic-engineering` · `ai-first-engineering` · `autonomous-loops` · `continuous-agent-loop` · `continuous-learning` · `continuous-learning-v2` · `deep-research` · `eval-harness` · `agent-eval` · `agent-harness-construction` · `cost-aware-llm-pipeline` · `foundation-models-on-device` · `token-budget-advisor` · `context-budget` · `iterative-retrieval`
**API/Backend patterns:** `api-design` · `backend-patterns` · `mcp-server-patterns` · `coding-standards` · `architecture-decision-records`
**Workflow:** `verification-loop` · `blueprint` · `codebase-onboarding` · `repo-scan` · `rules-distill` · `skill-comply` · `skill-stocktake` · `prompt-optimizer`
**Research/Content:** `market-research` · `deep-research` · `article-writing` · `search-first` · `exa-search` · `documentation-lookup`
**Misc:** `perl-patterns` · `perl-testing` · `videodb` · `video-editing` · `x-api` · `fal-ai-media` · `nanoclaw-repl` · `openclaw-persona-forge` · `dmux-workflows` · `claude-devfleet` · `crosspost`

### Workflow & Pianificazione
| Skill | Fonte | Uso |
|-------|-------|-----|
| `superpowers:brainstorming` | SP | Prima di qualsiasi feature/modifica |
| `superpowers:writing-plans` | SP | Scrivere piano da spec multi-step |
| `superpowers:executing-plans` | SP | Eseguire piano in sessione separata |
| `superpowers:subagent-driven-development` | SP | Delegare task indipendenti a subagenti |
| `superpowers:dispatching-parallel-agents` | SP | 2+ task indipendenti in parallelo |
| `sparc-methodology` | CF | Full SPARC (spec→arch→refine→complete) |
| `sparc:orchestrator` | CF | Orchestrare ciclo SPARC completo |
| `sparc:batch-executor` | CF | Task multipli in batch |
| `stream-chain` | CF | Pipeline di agenti in sequenza |
| `automation:workflow-select` | CF | Selezione workflow ottimale |

### Debug & Qualità
| Skill | Fonte | Uso |
|-------|-------|-----|
| `superpowers:systematic-debugging` | SP | Debug strutturato root cause |
| `superpowers:test-driven-development` | SP | TDD (test→codice→refactor) |
| `superpowers:verification-before-completion` | SP | Verifica prima di dichiarare done |
| `simplify` | BI | Review codice modificato per qualità |
| `verification-quality` | CF | QA avanzata |
| `sparc:tdd` | CF | TDD via SPARC |
| `sparc:tester` | CF | Testing specializzato |
| `sparc:debug` / `sparc:debugger` | CF | Debug via SPARC |
| `sparc:reviewer` | CF | Code review via SPARC |
| `sparc:security-review` | CF | Security audit |
| `webapp-testing` | CF | Testing applicazioni web |

### Analisi & Performance
| Skill | Fonte | Uso |
|-------|-------|-----|
| `analysis:performance-bottlenecks` | CF | Bottleneck prestazioni |
| `analysis:performance-report` | CF | Report prestazioni |
| `analysis:bottleneck-detect` | CF | Rilevamento bottleneck |
| `analysis:token-efficiency` | CF | Ottimizzare uso token |
| `analysis:token-usage` | CF | Report uso token |
| `analysis:COMMAND_COMPLIANCE_REPORT` | CF | Report compliance comandi |

### Code Review & Branch
| Skill | Fonte | Uso |
|-------|-------|-----|
| `superpowers:requesting-code-review` | SP | Richiedere review al termine feature |
| `superpowers:receiving-code-review` | SP | Gestire feedback review |
| `superpowers:finishing-a-development-branch` | SP | Finalizzare branch (merge/PR/cleanup) |
| `code-review:code-review` | PL | Review PR via `gh` (slash cmd) |
| `github:code-review` | CF | Code review GitHub |
| `github:code-review-swarm` | CF | Review con swarm agenti |
| `github-code-review` | CF | Skill review avanzata |

### GitHub & Repository
| Skill | Fonte | Uso |
|-------|-------|-----|
| `github:pr-manager` | CF | Lifecycle completo PR |
| `github:pr-enhance` | CF | Migliorare PR esistenti |
| `github:issue-tracker` | CF | Tracking issue con automazione |
| `github:issue-triage` | CF | Triage automatico issue |
| `github:repo-analyze` | CF | Analisi repository |
| `github:repo-architect` | CF | Struttura repo ottimale |
| `github:release-manager` | CF | Gestione release/versioni |
| `github:release-swarm` | CF | Release con swarm coordinato |
| `github:multi-repo-swarm` | CF | Coordinamento multi-repo |
| `github:sync-coordinator` | CF | Sincronizzazione cross-repo |
| `github:workflow-automation` | CF | GitHub Actions automation |
| `github:project-board-sync` | CF | Sync GitHub Projects |
| `github:swarm-issue` | CF | Issue → task multi-agente |
| `github:swarm-pr` | CF | PR management swarm |
| `github:github-modes` / `github:github-swarm` | CF | Modalità GitHub avanzate |
| `github-multi-repo` | CF | Skill multi-repo |
| `github-project-management` | CF | Project management |
| `github-release-management` | CF | Release management |
| `github-workflow-automation` | CF | Workflow automation |

### Frontend & UI
| Skill | Fonte | Uso |
|-------|-------|-----|
| `frontend-design` | PL | UI/componenti web production-grade |
| `sparc:designer` | CF | Design UI via SPARC |
| `canvas-design` | CF | Design su canvas |
| `web-artifacts-builder` | CF | Build artifact web interattivi |
| `algorithmic-art` | CF | Arte generativa/algoritmica |
| `brand-guidelines` | CF | Linee guida brand |
| `theme-factory` | CF | Creare temi UI |

### Documentazione & Contenuto
| Skill | Fonte | Uso |
|-------|-------|-----|
| `sparc:docs-writer` / `sparc:documenter` | CF | Documentazione via SPARC |
| `sparc:tutorial` | CF | Creare tutorial |
| `doc-coauthoring` | CF | Co-authoring documenti |
| `pdf` | CF | Lavorare con PDF |
| `docx` | CF | Lavorare con DOCX |
| `pptx` | CF | Presentazioni PowerPoint |
| `xlsx` | CF | Fogli Excel |
| `internal-comms` | CF | Comunicazioni interne |
| `slack-gif-creator` | CF | GIF per Slack |

### Swarm & Multi-Agent
| Skill | Fonte | Uso |
|-------|-------|-----|
| `swarm-advanced` | CF | Orchestrazione swarm avanzata |
| `swarm-orchestration` | CF | Coordinamento swarm base |
| `sparc:swarm-coordinator` | CF | Swarm via SPARC |
| `claude-flow-swarm` | CF | Swarm claude-flow |
| `hive-mind-advanced` | CF | Coordinamento hive-mind |
| `optimization:auto-topology` | CF | Ottimizzazione topologia swarm |
| `optimization:topology-optimize` | CF | Topologia agenti |
| `optimization:parallel-execute` / `optimization:parallel-execution` | CF | Esecuzione parallela |

### Automazione & Hooks
| Skill | Fonte | Uso |
|-------|-------|-----|
| `hooks-automation` | CF | Automazione via hooks |
| `hooks:setup` | CF | Configurare hooks |
| `hooks:pre-task` / `hooks:post-task` | CF | Hooks pre/post task |
| `hooks:pre-edit` / `hooks:post-edit` | CF | Hooks pre/post edit |
| `hooks:session-end` | CF | Hook fine sessione |
| `hooks:overview` | CF | Panoramica hooks disponibili |
| `automation:auto-agent` | CF | Agenti automatici |
| `automation:smart-agents` / `automation:smart-spawn` | CF | Agenti intelligenti/spawn |
| `automation:self-healing` | CF | Auto-riparazione workflow |
| `automation:session-memory` | CF | Memoria persistente sessione |
| `loop` | BI | Task ricorrenti a intervallo (es. `loop 5m /cmd`) |
| `schedule` | BI | Pianificare agenti remoti con cron |
| `update-config` | BI | Configurare settings.json (hooks, behavior) |

### Monitoring
| Skill | Fonte | Uso |
|-------|-------|-----|
| `monitoring:status` | CF | Stato sistema agenti |
| `monitoring:agents` / `monitoring:agent-metrics` | CF | Monitor/metriche agenti |
| `monitoring:real-time-view` | CF | Vista real-time |
| `monitoring:swarm-monitor` | CF | Monitor swarm |
| `optimization:cache-manage` | CF | Gestione cache |

### Memoria & AgentDB
| Skill | Fonte | Uso |
|-------|-------|-----|
| `agentdb-advanced` | CF | AgentDB avanzato |
| `agentdb-learning` | CF | Apprendimento pattern |
| `agentdb-memory-patterns` | CF | Pattern memoria |
| `agentdb-optimization` | CF | Ottimizzazione AgentDB |
| `agentdb-vector-search` | CF | Ricerca vettoriale semantica |
| `reasoningbank-agentdb` | CF | ReasoningBank + AgentDB |
| `reasoningbank-intelligence` | CF | Intelligenza ReasoningBank |
| `claude-flow-memory` | CF | Memoria persistente claude-flow |

### SPARC Specializzato
| Skill | Uso |
|-------|-----|
| `sparc:architect` | Architettura sistema |
| `sparc:coder` / `sparc:code` | Implementazione codice |
| `sparc:researcher` | Ricerca tecnica |
| `sparc:analyzer` | Analisi codice |
| `sparc:optimizer` | Ottimizzazione |
| `sparc:devops` | DevOps tasks |
| `sparc:mcp` | Sviluppo MCP servers |
| `sparc:integration` | Integrazione sistemi |
| `sparc:memory-manager` | Gestione memoria |
| `sparc:spec-pseudocode` | Spec + pseudocodice |
| `sparc:innovator` | Soluzioni creative |
| `sparc:ask` | Query al sistema SPARC |
| `sparc:workflow-manager` | Gestione workflow |
| `sparc:refinement-optimization-mode` | Modalità rifinitura |
| `sparc:post-deployment-monitoring-mode` | Monitoring post-deploy |
| `sparc:supabase-admin` | Admin Supabase |
| `sparc:sparc` / `sparc:sparc-modes` | SPARC generico/modalità |

### Librerie, API & MCP
| Skill | Fonte | Uso |
|-------|-------|-----|
| `context7-mcp` | Custom | Fetch docs librerie (auto-attivato) |
| `claude-api` | BI | Sviluppare con Claude API/Anthropic SDK |
| `mcp-builder` | CF | Costruire MCP servers |
| `sparc:mcp` | CF | MCP via SPARC |
| `pair-programming` | CF | Sessioni pair programming |
| `browser` | CF | Automazione browser |

### v3 & Flow Nexus
| Skill | Uso |
|-------|-----|
| `v3-core-implementation` | Implementazione core v3 |
| `v3-ddd-architecture` | DDD architecture v3 |
| `v3-cli-modernization` | CLI modernization v3 |
| `v3-integration-deep` | Integrazione profonda v3 |
| `v3-mcp-optimization` | MCP optimization v3 |
| `v3-memory-unification` | Unificazione memoria v3 |
| `v3-performance-optimization` | Ottimizzazione prestazioni v3 |
| `v3-security-overhaul` | Revisione sicurezza v3 |
| `v3-swarm-coordination` | Swarm coordination v3 |
| `flow-nexus-neural` | Flow Nexus neural patterns |
| `flow-nexus-platform` | Flow Nexus piattaforma |
| `flow-nexus-swarm` | Flow Nexus swarm |

### Configurazione & Meta
| Skill | Fonte | Uso |
|-------|-------|-----|
| `superpowers:using-superpowers` | SP | Intro sistema skills (leggere a inizio conv.) |
| `superpowers:using-git-worktrees` | SP | Isolare lavoro con worktrees |
| `superpowers:writing-skills` / `skill-builder` | SP/CF | Creare nuove skills |
| `skill-creator` | CF | Skill creator avanzato |
| `keybindings-help` | BI | Personalizzare scorciatoie tastiera |
| `claude-flow-help` | CF | Aiuto claude-flow |

**Agent `code-reviewer`** (SP) — revisionare implementazioni completate vs piano. Invocare dopo step significativi.

---

## Claude Flow (when needed)

```bash
# Quick setup
claude mcp add claude-flow -- npx -y @claude-flow/cli@latest
npx @claude-flow/cli@latest doctor --fix

# Swarm (for complex multi-agent tasks)
npx @claude-flow/cli@latest swarm init --topology hierarchical --max-agents 8 --strategy specialized

# Memory
npx @claude-flow/cli@latest memory store --key "key" --value "value" --namespace ns
npx @claude-flow/cli@latest memory search --query "search term"
```

- Claude Code's Task tool handles execution (agents, file ops, code, git)
- CLI tools handle coordination (swarm init, memory, hooks)
- NEVER use CLI tools as a substitute for Task tool agents
