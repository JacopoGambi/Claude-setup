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

> All invokable via `Skill("name")` or `Skill("prefix:name")`. Sources: **SP**=superpowers, **CF**=claude-flow, **BI**=built-in, **PL**=plugin, **ECC**=everything-claude-code.

### ECC Agents (`~/.claude/agents/`) — invoke via Agent tool
| Agent | Use |
|-------|-----|
| `architect` | System architecture, scalability, technical decisions |
| `planner` | Complex feature planning and refactoring |
| `tdd-guide` | TDD: enforcing write-tests-first |
| `security-reviewer` | Vulnerability detection and remediation |
| `performance-optimizer` | Performance analysis and bottlenecks |
| `refactor-cleaner` | Dead code cleanup and consolidation |
| `doc-updater` | Documentation and codemaps updates |
| `docs-lookup` | API documentation search via Context7 |
| `loop-operator` | Monitoring and management of autonomous agent loops |
| `harness-optimizer` | Agent harness configuration optimization |
| `code-reviewer` *(superpowers)* | Review implementations vs plan |
| **Language Reviewers** | |
| `python-reviewer` | Python (PEP8, type hints, security) |
| `typescript-reviewer` | TypeScript/JavaScript |
| `go-reviewer` | Go idioms and best practices |
| `rust-reviewer` | Rust ownership and patterns |
| `java-reviewer` | Java and Spring Boot |
| `kotlin-reviewer` | Kotlin/Android/KMP |
| `cpp-reviewer` | Modern C++ |
| `flutter-reviewer` | Flutter and Dart |
| `database-reviewer` | PostgreSQL/Supabase schema and queries |
| `healthcare-reviewer` | Clinical safety, PHI compliance |
| **Build Resolvers** | |
| `build-error-resolver` | Build/TypeScript errors (minimal diffs) |
| `go-build-resolver` | Go build failures and vet warnings |
| `rust-build-resolver` | Rust build and borrow checker |
| `java-build-resolver` | Maven/Gradle build failures |
| `kotlin-build-resolver` | Kotlin/Gradle compiler errors |
| `cpp-build-resolver` | CMake and linker problems |
| `pytorch-build-resolver` | PyTorch/CUDA training errors |
| **Specialized** | |
| `e2e-runner` | E2E testing Playwright/Vercel |
| `chief-of-staff` | Email/Slack/communications triage |

### ECC Slash Commands (`/cmd`) — source: `~/.claude/commands/`
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

### ECC Skills by Language/Framework (`~/.claude/skills/`)
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

### Workflow & Planning
| Skill | Source | Use |
|-------|--------|-----|
| `superpowers:brainstorming` | SP | Before any feature/change |
| `superpowers:writing-plans` | SP | Write plan from multi-step spec |
| `superpowers:executing-plans` | SP | Execute plan in a separate session |
| `superpowers:subagent-driven-development` | SP | Delegate independent tasks to subagents |
| `superpowers:dispatching-parallel-agents` | SP | 2+ independent tasks in parallel |
| `sparc-methodology` | CF | Full SPARC (spec→arch→refine→complete) |
| `sparc:orchestrator` | CF | Orchestrate full SPARC cycle |
| `sparc:batch-executor` | CF | Multiple tasks in batch |
| `stream-chain` | CF | Sequential agent pipeline |
| `automation:workflow-select` | CF | Optimal workflow selection |

### Debug & Quality
| Skill | Source | Use |
|-------|--------|-----|
| `superpowers:systematic-debugging` | SP | Structured root cause debugging |
| `superpowers:test-driven-development` | SP | TDD (test→code→refactor) |
| `superpowers:verification-before-completion` | SP | Verify before declaring done |
| `simplify` | BI | Review changed code for quality |
| `verification-quality` | CF | Advanced QA |
| `sparc:tdd` | CF | TDD via SPARC |
| `sparc:tester` | CF | Specialized testing |
| `sparc:debug` / `sparc:debugger` | CF | Debug via SPARC |
| `sparc:reviewer` | CF | Code review via SPARC |
| `sparc:security-review` | CF | Security audit |
| `webapp-testing` | CF | Web application testing |

### Analysis & Performance
| Skill | Source | Use |
|-------|--------|-----|
| `analysis:performance-bottlenecks` | CF | Performance bottlenecks |
| `analysis:performance-report` | CF | Performance report |
| `analysis:bottleneck-detect` | CF | Bottleneck detection |
| `analysis:token-efficiency` | CF | Optimize token usage |
| `analysis:token-usage` | CF | Token usage report |
| `analysis:COMMAND_COMPLIANCE_REPORT` | CF | Command compliance report |

### Code Review & Branch
| Skill | Source | Use |
|-------|--------|-----|
| `superpowers:requesting-code-review` | SP | Request review at feature completion |
| `superpowers:receiving-code-review` | SP | Handle review feedback |
| `superpowers:finishing-a-development-branch` | SP | Finalize branch (merge/PR/cleanup) |
| `code-review:code-review` | PL | Review PR via `gh` (slash cmd) |
| `github:code-review` | CF | GitHub code review |
| `github:code-review-swarm` | CF | Review with agent swarm |
| `github-code-review` | CF | Advanced review skill |

### GitHub & Repository
| Skill | Source | Use |
|-------|--------|-----|
| `github:pr-manager` | CF | Full PR lifecycle |
| `github:pr-enhance` | CF | Improve existing PRs |
| `github:issue-tracker` | CF | Issue tracking with automation |
| `github:issue-triage` | CF | Automatic issue triage |
| `github:repo-analyze` | CF | Repository analysis |
| `github:repo-architect` | CF | Optimal repo structure |
| `github:release-manager` | CF | Release/version management |
| `github:release-swarm` | CF | Release with coordinated swarm |
| `github:multi-repo-swarm` | CF | Multi-repo coordination |
| `github:sync-coordinator` | CF | Cross-repo synchronization |
| `github:workflow-automation` | CF | GitHub Actions automation |
| `github:project-board-sync` | CF | GitHub Projects sync |
| `github:swarm-issue` | CF | Issue → multi-agent task |
| `github:swarm-pr` | CF | PR management swarm |
| `github:github-modes` / `github:github-swarm` | CF | Advanced GitHub modes |
| `github-multi-repo` | CF | Multi-repo skill |
| `github-project-management` | CF | Project management |
| `github-release-management` | CF | Release management |
| `github-workflow-automation` | CF | Workflow automation |

### Frontend & UI
| Skill | Source | Use |
|-------|--------|-----|
| `frontend-design` | PL | Production-grade web UI/components |
| `sparc:designer` | CF | UI design via SPARC |
| `canvas-design` | CF | Canvas design |
| `web-artifacts-builder` | CF | Build interactive web artifacts |
| `algorithmic-art` | CF | Generative/algorithmic art |
| `brand-guidelines` | CF | Brand guidelines |
| `theme-factory` | CF | Create UI themes |

### Documentation & Content
| Skill | Source | Use |
|-------|--------|-----|
| `sparc:docs-writer` / `sparc:documenter` | CF | Documentation via SPARC |
| `sparc:tutorial` | CF | Create tutorials |
| `doc-coauthoring` | CF | Document co-authoring |
| `pdf` | CF | Work with PDFs |
| `docx` | CF | Work with DOCX |
| `pptx` | CF | PowerPoint presentations |
| `xlsx` | CF | Excel spreadsheets |
| `internal-comms` | CF | Internal communications |
| `slack-gif-creator` | CF | GIFs for Slack |

### Swarm & Multi-Agent
| Skill | Source | Use |
|-------|--------|-----|
| `swarm-advanced` | CF | Advanced swarm orchestration |
| `swarm-orchestration` | CF | Basic swarm coordination |
| `sparc:swarm-coordinator` | CF | Swarm via SPARC |
| `claude-flow-swarm` | CF | Claude-flow swarm |
| `hive-mind-advanced` | CF | Hive-mind coordination |
| `optimization:auto-topology` | CF | Swarm topology optimization |
| `optimization:topology-optimize` | CF | Agent topology |
| `optimization:parallel-execute` / `optimization:parallel-execution` | CF | Parallel execution |

### Automation & Hooks
| Skill | Source | Use |
|-------|--------|-----|
| `hooks-automation` | CF | Automation via hooks |
| `hooks:setup` | CF | Configure hooks |
| `hooks:pre-task` / `hooks:post-task` | CF | Pre/post task hooks |
| `hooks:pre-edit` / `hooks:post-edit` | CF | Pre/post edit hooks |
| `hooks:session-end` | CF | Session end hook |
| `hooks:overview` | CF | Overview of available hooks |
| `automation:auto-agent` | CF | Automatic agents |
| `automation:smart-agents` / `automation:smart-spawn` | CF | Smart agents/spawn |
| `automation:self-healing` | CF | Self-healing workflow |
| `automation:session-memory` | CF | Persistent session memory |
| `loop` | BI | Recurring tasks on interval (e.g. `loop 5m /cmd`) |
| `schedule` | BI | Schedule remote agents with cron |
| `update-config` | BI | Configure settings.json (hooks, behavior) |

### Monitoring
| Skill | Source | Use |
|-------|--------|-----|
| `monitoring:status` | CF | Agent system status |
| `monitoring:agents` / `monitoring:agent-metrics` | CF | Agent monitor/metrics |
| `monitoring:real-time-view` | CF | Real-time view |
| `monitoring:swarm-monitor` | CF | Swarm monitor |
| `optimization:cache-manage` | CF | Cache management |

### Memory & AgentDB
| Skill | Source | Use |
|-------|--------|-----|
| `agentdb-advanced` | CF | Advanced AgentDB |
| `agentdb-learning` | CF | Pattern learning |
| `agentdb-memory-patterns` | CF | Memory patterns |
| `agentdb-optimization` | CF | AgentDB optimization |
| `agentdb-vector-search` | CF | Semantic vector search |
| `reasoningbank-agentdb` | CF | ReasoningBank + AgentDB |
| `reasoningbank-intelligence` | CF | ReasoningBank intelligence |
| `claude-flow-memory` | CF | Claude-flow persistent memory |

### Specialized SPARC
| Skill | Use |
|-------|-----|
| `sparc:architect` | System architecture |
| `sparc:coder` / `sparc:code` | Code implementation |
| `sparc:researcher` | Technical research |
| `sparc:analyzer` | Code analysis |
| `sparc:optimizer` | Optimization |
| `sparc:devops` | DevOps tasks |
| `sparc:mcp` | MCP server development |
| `sparc:integration` | System integration |
| `sparc:memory-manager` | Memory management |
| `sparc:spec-pseudocode` | Spec + pseudocode |
| `sparc:innovator` | Creative solutions |
| `sparc:ask` | SPARC system queries |
| `sparc:workflow-manager` | Workflow management |
| `sparc:refinement-optimization-mode` | Refinement mode |
| `sparc:post-deployment-monitoring-mode` | Post-deploy monitoring |
| `sparc:supabase-admin` | Supabase admin |
| `sparc:sparc` / `sparc:sparc-modes` | Generic SPARC/modes |

### Libraries, APIs & MCP
| Skill | Source | Use |
|-------|--------|-----|
| `context7-mcp` | Custom | Fetch library docs (auto-activated) |
| `claude-api` | BI | Develop with Claude API/Anthropic SDK |
| `mcp-builder` | CF | Build MCP servers |
| `sparc:mcp` | CF | MCP via SPARC |
| `pair-programming` | CF | Pair programming sessions |
| `browser` | CF | Browser automation |

### v3 & Flow Nexus
| Skill | Use |
|-------|-----|
| `v3-core-implementation` | v3 core implementation |
| `v3-ddd-architecture` | v3 DDD architecture |
| `v3-cli-modernization` | v3 CLI modernization |
| `v3-integration-deep` | v3 deep integration |
| `v3-mcp-optimization` | v3 MCP optimization |
| `v3-memory-unification` | v3 memory unification |
| `v3-performance-optimization` | v3 performance optimization |
| `v3-security-overhaul` | v3 security overhaul |
| `v3-swarm-coordination` | v3 swarm coordination |
| `flow-nexus-neural` | Flow Nexus neural patterns |
| `flow-nexus-platform` | Flow Nexus platform |
| `flow-nexus-swarm` | Flow Nexus swarm |

### Configuration & Meta
| Skill | Source | Use |
|-------|--------|-----|
| `superpowers:using-superpowers` | SP | Skills system intro (read at session start) |
| `superpowers:using-git-worktrees` | SP | Isolate work with worktrees |
| `superpowers:writing-skills` / `skill-builder` | SP/CF | Create new skills |
| `skill-creator` | CF | Advanced skill creator |
| `keybindings-help` | BI | Customize keyboard shortcuts |
| `claude-flow-help` | CF | Claude-flow help |

**Agent `code-reviewer`** (SP) — review completed implementations vs plan. Invoke after significant steps.

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
