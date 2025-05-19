# 1000x DEV – Next.js + Supabase Starter

A minimal yet batteries-included boilerplate to spin up a full-stack project in **under 5 minutes**. It mirrors the AI-assisted workflow you outlined—Cursor IDE MCPs, Playwright-first TDD, GitHub Actions CI—while keeping secrets local.

---
## 1 · Prerequisites
| Tool | Version |
|------|---------|
| Node | 18.x LTS |
| npm  | ≥ 9 |
| Docker (optional) | for local Supabase |

---
## 2 · Quick Start
```bash
# 1 · Clone the template
npx degit 1000x-dev/next-supabase-starter my-app
cd my-app
# 2 · Bootstrap (copies .env.example → .env & installs Husky)
npm run init:project
# 3 · Run the dev server
npm run dev
```

---
## 3 · Directory Layout
```text
.
├── .cursor/                 # MCP placeholders – add keys locally
│   └── mcp.json
├── .github/workflows/ci.yml # Node 18 + Playwright CI gate
├── .husky/                  # Pre-commit hook → test & lint
├── e2e/                     # Playwright specs (sample included)
├── src/ | pages/ | public/  # Standard Next 13 (app dir optional)
├── playwright.config.ts
├── .env.example             # Copy of required vars sans secrets
├── .gitignore               # Ignores .env & generated files
├── package.json             # Conventional commits & scripts
└── README.md                # You’re reading the raw source
```

---
## 4 · Scripts
| Script | Purpose |
|--------|---------|
| `dev` | `next dev` – local dev server |
| `build` | `next build` |
| `start` | `next start` (prod) |
| `lint` | `next lint` + `tsc --noEmit` |
| `test:e2e` | `playwright test` |
| **`init:project`** | `cp .env.example .env && npx husky install` |

*A `prepare` hook keeps Husky active on every `npm install`.*

---
## 5 · Environment Variables
- **Never** commit `.env` – it’s in `.gitignore`.
- `.env.example` documents **all** keys (OpenAI, Anthropic, Supabase, GitHub PAT, etc.).
- CI pulls secrets from **GitHub → Settings → Actions → Secrets and variables**.

---
## 6 · CI / CD
```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm ci
      - run: npm run test:e2e
```
*Add a deploy step (e.g. Vercel) after tests pass.*

---
## 7 · AI Workflow Integrations
`/.cursor/mcp.json` ships with MCP stubs:
```json
{
  "memoryBank": {"apiKey": ""},
  "taskmaster": {"apiKey": ""},
  "context7": {"apiKey": ""},
  "github": {"token": ""},
  "supabase": {"url": "", "anonKey": ""}
}
```
Fill these locally or via Cursor’s secret store.

---
## 8 · Conventional Commits & Hook
- Commit messages follow `feat|fix|chore(scope): message`.
- Commit-lint plus Playwright tests run in the pre-commit Husky hook.

---
## 9 · Playwright Example Spec
`e2e/example.spec.ts` ships with a trivial homepage smoke test so the first run is green.

---
## 10 · Licence
MIT (swap for another licence if preferred).
