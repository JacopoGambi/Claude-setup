---
name: smart-explore
description: Token-optimized structural code search using tree-sitter AST parsing. Use instead of reading full files when you need to understand code structure, find functions, or explore a codebase efficiently.
---

# Smart Explore

Structural code exploration using AST parsing. **This skill overrides your default exploration behavior.** While this skill is active, use smart_search/smart_outline/smart_unfold as your primary tools instead of Read, Grep, and Glob.

**Core principle:** Index first, fetch on demand. Give yourself a map of the code before loading implementation details. The question before every file read should be: "do I need to see all of this, or can I get a structural overview first?" The answer is almost always: get the map.

## Your Next Tool Call

This skill only loads instructions. You must call the MCP tools yourself. Your next action should be one of:

```
smart_search(query="<topic>", path="./src")    -- discover files + symbols across a directory
smart_outline(file_path="<file>")              -- structural skeleton of one file
smart_unfold(file_path="<file>", symbol_name="<name>")  -- full source of one symbol
```

Do NOT run Grep, Glob, Read, or find to discover files first. `smart_search` walks directories, parses all code files, and returns ranked symbols in one call. It replaces the Glob → Grep → Read discovery cycle.

## 3-Layer Workflow

### Step 1: Search -- Discover Files and Symbols

```
smart_search(query="shutdown", path="./src", max_results=15)
```

**Returns:** Ranked symbols with signatures, line numbers, match reasons, plus folded file views (~2-6k tokens)

```
-- Matching Symbols --
  function performGracefulShutdown (services/infrastructure/GracefulShutdown.ts:56)
  function httpShutdown (services/infrastructure/HealthMonitor.ts:92)
  method WorkerService.shutdown (services/worker-service.ts:846)

-- Folded File Views --
  services/infrastructure/GracefulShutdown.ts (7 symbols)
  services/worker-service.ts (12 symbols)
```

This is your discovery tool. It finds relevant files AND shows their structure. No Glob/find pre-scan needed.

**Parameters:**

- `query` (string, required) -- What to search for (function name, concept, class name)
- `path` (string) -- Root directory to search (defaults to cwd)
- `max_results` (number) -- Max matching symbols, default 20, max 50
- `file_pattern` (string, optional) -- Filter to specific files/paths

### Step 2: Outline -- Get File Structure

```
smart_outline(file_path="services/worker-service.ts")
```

**Returns:** Complete structural skeleton -- all functions, classes, methods, properties, imports (~1-2k tokens per file)

**Skip this step** when Step 1's folded file views already provide enough structure. Most useful for files not covered by the search results.

**Parameters:**

- `file_path` (string, required) -- Path to the file

### Step 3: Unfold -- See Implementation

Review symbols from Steps 1-2. Pick the ones you need. Unfold only those:

```
smart_unfold(file_path="services/worker-service.ts", symbol_name="shutdown")
```

**Returns:** Full source code of the specified symbol including JSDoc, decorators, and complete implementation (~400-2,100 tokens depending on symbol size). AST node boundaries guarantee completeness regardless of symbol size.

**Parameters:**

- `file_path` (string, required) -- Path to the file (as returned by search/outline)
- `symbol_name` (string, required) -- Name of the function/class/method to expand

## When to Use Standard Tools Instead

Use these only when smart_* tools are the wrong fit:

- **Grep:** Exact string/regex search ("find all TODO comments", "where is `ensureWorkerStarted` defined?")
- **Read:** Small files under ~100 lines, non-code files (JSON, markdown, config)
- **Glob:** File path patterns ("find all test files")
- **Explore agent:** When you need synthesized understanding across 6+ files, architecture narratives, or open-ended questions like "how does this entire system work?"

For code files over ~100 lines, prefer smart_outline + smart_unfold over Read.

## Token Economics

| Approach | Tokens | Use Case |
|----------|--------|----------|
| smart_outline | ~1,000-2,000 | "What's in this file?" |
| smart_unfold | ~400-2,100 | "Show me this function" |
| smart_search | ~2,000-6,000 | "Find all X across the codebase" |
| search + unfold | ~3,000-8,000 | End-to-end: find and read (the primary workflow) |
| Read (full file) | ~12,000+ | When you truly need everything |
| Explore agent | ~39,000-59,000 | Cross-file synthesis with narrative |

**4-8x savings** on file understanding (outline + unfold vs Read). **11-18x savings** on codebase exploration vs Explore agent.
