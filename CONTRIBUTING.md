# Contributing Guidelines

This document is optimized for AI agents contributing to this project while remaining human-readable. These guidelines ensure consistent development practices and maintainable code across all contributors.

## ⚠️ CRITICAL: Context Management

### Token Budget Management
AI agents have a strict ~200,000 token context limit:
- Reserve 50,000 tokens for working memory
- Reserve 50,000 tokens for response generation
- Leave 100,000 tokens maximum for file processing
- Process files in 25,000 token chunks maximum

### Content Density Guide
Different file types consume tokens differently:
- Code files: ~1 token per word
- Markdown files: ~1.5 tokens per word
- Conversation logs: ~2-3 tokens per word
- ADJUST YOUR CHUNK SIZES ACCORDINGLY

### File Size Quick Reference
| File Type | Direct Read Limit | Chunk Size | Stop Size |
|-----------|------------------|------------|-----------|
| Code | 100KB | 50KB | 200KB |
| Markdown | 50KB | 25KB | 100KB |
| Logs | 25KB | 10KB | 50KB |
| Conversation | 10KB | 5KB | 25KB |

## First Steps

BEFORE READING ANY FILES:
1. List available files and their sizes
2. Identify conversation logs and large files
3. Request guidance if files exceed safe limits
4. Plan your reading strategy BEFORE starting

When starting a new project:
1. Review existing documentation within size limits
2. Create missing essential documents
3. Consult the user if information is insufficient
4. Document your process

## File Reading Protocol

CRITICAL: When accessing ANY file:

1. ALWAYS check file info first:
```bash
# Do this BEFORE attempting to read
get_file_info <path>
```

2. Check against size thresholds:
```typescript
const THRESHOLDS = {
  CONVERSATION_LOG: { SAFE: 10000, CHUNK: 5000, STOP: 25000 },
  MARKDOWN: { SAFE: 50000, CHUNK: 25000, STOP: 100000 },
  CODE: { SAFE: 100000, CHUNK: 50000, STOP: 200000 }
};

async function checkFileSize(filename, type = 'CODE') {
  const info = await get_file_info(filename);
  const limits = THRESHOLDS[type];
  
  if (info.size > limits.STOP) {
    return 'STOP_AND_REQUEST_GUIDANCE';
  }
  if (info.size > limits.SAFE) {
    return 'USE_CHUNKED_READING';
  }
  return 'SAFE_TO_READ';
}
```

3. For conversation logs:
```typescript
// Before processing any file
if (filename.endsWith('.md') || filename.includes('log')) {
  const info = await get_file_info(filename);
  // Check for conversation markers
  if (info.content_preview?.includes('**Assistant:**')) {
    // This is an AI conversation log
    if (info.size > THRESHOLDS.CONVERSATION_LOG.SAFE) {
      // STOP - Request specific sections to process
      return;
    }
  }
}
```

### Chunked Reading Strategy

When files exceed safe limits:

1. For markdown/text files:
```typescript
// Read in chunks
let offset = 0;
const CHUNK_SIZE = 25000;
while (true) {
  const chunk = await read_file(filename, {
    start: offset,
    end: offset + CHUNK_SIZE
  });
  if (!chunk) break;
  
  // Process chunk
  // Clear unnecessary context
  offset += CHUNK_SIZE;
}
```

2. For conversation logs:
```typescript
// Focus on specific parts
const options = [
  'latest N messages',
  'specific date range',
  'commit-related messages only',
  'final decisions only'
];
// Request user preference
```

3. For CSV/Excel files:
```typescript
// Use dedicated parsers with streaming
import Papa from 'papaparse';
import XLSX from 'xlsx';

// For CSVs
Papa.parse(file, {
  header: true,
  step: (row) => {
    // Process one row at a time
  },
  complete: () => {
    // Finalize processing
  }
});
```

### Error Recovery

If you hit a token limit error:
1. STOP immediately
2. Document what you've processed
3. Clear your context
4. Request specific portions:
   ```markdown
   Please provide:
   - Only the latest N messages
   - Messages from specific dates
   - Only final decision messages
   - Only commit-related content
   ```

## Team Environment

### Development Stack
- Local: OrbStack on macOS
- IDE: VS Code for macOS
- Production: Coolify
- DNS: Cloudflare
- Version Control: GitHub (@illuminaresolutions)

## Project Files

Essential files and their handling:
1. `README.md`: 
   - Read in full if under 50KB
   - Focus on setup/overview sections if larger
2. `DEVELOPER_LOG.md`:
   - Read latest entries first
   - Load older entries only if needed
3. `ROADMAP.md`:
   - Focus on current milestone
   - Load future milestones on demand
4. `CONTRIBUTING.md`:
   - This file - read relevant sections
5. `.gitignore`:
   - Usually safe to read in full

## Task Management Protocol

### 1. Starting Work

| Step | Description |
|------|-------------|
| 1 | Review documentation (within size limits) |
| 2 | Identify or create issue |
| 3 | Create branch |
| 4 | Plan implementation |

### 2. Development Process

| Aspect | Requirement |
|--------|-------------|
| Tracking | Use taskmanager MCP |
| Documentation | Continuous |
| Testing | Pre-commit |
| Pushing | On working state |

### 3. Git Workflow

| Component | Format |
|-----------|---------||
| Branch naming | `type/description` |
| Commit message | `type: description (#issue)` |
| Types | feat, fix, docs, style, refactor, test |

## Documentation Standards

### DEVELOPER_LOG.md Format

```markdown
## YYYY-MM-DD - Brief Title

**Task**: #issue_number
**Status**: In Progress/Complete

### Progress
- Technical detail of what was done
- Discoveries made
- Decisions and rationale

### Next Steps
- Upcoming tasks
- Known issues
- Questions to resolve
```

## MCP Server Usage

### Required Tools

| Purpose | Tools |
|---------|--------|
| Planning | sequential-thinking, taskmanager |
| Research | webresearch |
| Programming | claude-3-5-sonnet, gpt-4o (assistant) |
| Validation | sequential-thinking |

### Tool Usage Rules
- Never set requires_approval to true
- Always wait for tool responses
- Use webresearch for documentation
- Use sequential-thinking for validation

## Quick Start

1. Check file sizes:
   ```bash
   get_file_info README.md
   get_file_info DEVELOPER_LOG.md
   get_file_info ROADMAP.md
   ```

2. Plan reading strategy:
   ```bash
   # For large files, request specific sections
   # For conversation logs, request latest entries
   ```

3. Create/identify issue:
   ```bash
   # Use GitHub MCP or UI
   ```

4. Start development:
   ```bash
   git checkout -b type/description
   # Use sequential-thinking MCP for planning
   # Use taskmanager MCP for tracking
   ```

Remember: The goal is maintainable code AND maintainable context.