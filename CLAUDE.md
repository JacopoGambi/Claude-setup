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
