---
name: timeline-report
description: Generate a "Journey Into [Project]" narrative report analyzing a project's entire development history from claude-mem's timeline. Use when asked for a timeline report, project history analysis, development journey, or full project report.
---

# Timeline Report

Generate a comprehensive narrative analysis of a project's entire development history using claude-mem's persistent memory timeline.

## When to Use

Use when users ask for:

- "Write a timeline report"
- "Journey into [project]"
- "Analyze my project history"
- "Full project report"
- "Summarize the entire development history"
- "What's the story of this project?"

## Prerequisites

The claude-mem worker must be running on localhost:37777. The project must have claude-mem observations recorded.

## Workflow

### Step 1: Determine the Project Name

Ask the user which project to analyze if not obvious from context. The project name is typically the directory name of the project (e.g., "tokyo", "my-app"). If the user says "this project", use the current working directory's basename.

**Worktree Detection:** Before using the directory basename, check if the current directory is a git worktree:

```bash
git_dir=$(git rev-parse --git-dir 2>/dev/null)
git_common_dir=$(git rev-parse --git-common-dir 2>/dev/null)
if [ "$git_dir" != "$git_common_dir" ]; then
  parent_project=$(basename "$(dirname "$git_common_dir")")
  echo "Worktree detected. Parent project: $parent_project"
else
  parent_project=$(basename "$PWD")
fi
echo "$parent_project"
```

If a worktree is detected, use `$parent_project` as the project name for all API calls.

### Step 2: Fetch the Full Timeline

```bash
curl -s "http://localhost:37777/api/context/inject?project=PROJECT_NAME&full=true"
```

**Token estimates:**
- Small project (< 1,000 observations): ~20-50K tokens
- Medium project (1,000-10,000 observations): ~50-300K tokens
- Large project (10,000-35,000 observations): ~300-750K tokens

### Step 3: Estimate Token Count

Report to the user before proceeding:

```
Timeline fetched: ~X observations, estimated ~Yk tokens.
This analysis will consume approximately Yk input tokens + ~5-10k output tokens.
Proceed? (y/n)
```

Wait for user confirmation before continuing if the timeline exceeds 100K tokens.

### Step 4: Analyze with a Subagent

Deploy an Agent (using the Task tool) with the full timeline. The agent should write a comprehensive narrative report titled "Journey Into [PROJECT_NAME]" covering:

1. **Project Genesis** - First commits, initial vision, founding technical decisions
2. **Architectural Evolution** - How architecture changed over time, major pivots
3. **Key Breakthroughs** - "Aha" moments where difficult problems were solved
4. **Work Patterns** - Debugging cycles, feature sprints, refactoring phases
5. **Technical Debt** - Where shortcuts were taken and paid back
6. **Challenges and Debugging Sagas** - Hardest problems, multi-session efforts
7. **Memory and Continuity** - How persistent memory affected development
8. **Token Economics & Memory ROI** - Quantitative analysis via SQLite queries:
   ```sql
   SELECT SUM(discovery_tokens) FROM observations WHERE project = 'PROJECT_NAME';
   SELECT COUNT(DISTINCT memory_session_id) FROM observations WHERE project = 'PROJECT_NAME';
   SELECT AVG(discovery_tokens), AVG(LENGTH(title||COALESCE(subtitle,'')||COALESCE(narrative,'')||COALESCE(facts,''))/4) FROM observations WHERE project = 'PROJECT_NAME' AND discovery_tokens > 0;
   SELECT id, title, discovery_tokens FROM observations WHERE project = 'PROJECT_NAME' ORDER BY discovery_tokens DESC LIMIT 5;
   SELECT strftime('%Y-%m', created_at) as month, COUNT(*) as obs, SUM(discovery_tokens), COUNT(DISTINCT memory_session_id) as sessions FROM observations WHERE project = 'PROJECT_NAME' GROUP BY month ORDER BY month;
   ```
9. **Timeline Statistics** - Date range, totals, breakdowns by type
10. **Lessons and Meta-Observations** - Patterns from the full history

Target 3,000-6,000 words. Use specific observation IDs and timestamps. Connect events across time narratively.

### Step 5: Save the Report

Save output as `./journey-into-PROJECT_NAME.md`.

### Step 6: Report Completion

Tell the user: where the report was saved, approximate token cost, date range covered, number of observations analyzed.

## Error Handling

- **Empty timeline:** "No observations found for project 'X'. Check: `curl -s 'http://localhost:37777/api/search?query=*&limit=1'`"
- **Worker not running:** "The claude-mem worker is not responding on port 37777."
