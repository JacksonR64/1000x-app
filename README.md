# 🚀 1000x-app – AI-First Next.js Starter Template

> **A sophisticated, batteries-included Next.js 15 + Supabase starter with AI-first development tools, MCP integration, and intelligent setup automation.**

Get from zero to production-ready AI app in **under 5 minutes** with our smart initialization script that validates API keys, sets up MCP tools, and configures your development environment automatically.

[![Next.js 15](https://img.shields.io/badge/Next.js-15.3.2-black?logo=next.js)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue?logo=typescript)](https://www.typescriptlang.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Ready-green?logo=supabase)](https://supabase.com/)
[![Tailwind CSS 4](https://img.shields.io/badge/Tailwind-4.0-38bdf8?logo=tailwindcss)](https://tailwindcss.com/)

---

## ✨ **What Makes This Different**

- 🧠 **Memory Bank System**: Persistent AI context through structured markdown files
- 🤖 **MCP Integration**: Ready for Cursor IDE with TaskMaster-AI, Context7, and Supabase agents
- 🔐 **Smart API Key Validation**: Detects fake keys, validates formats, guides you to the right links
- 🎯 **Intelligent Defaults**: Press Enter to speed through setup with sensible defaults
- 🧪 **Testing-First**: Comprehensive test suite and validation built-in

---

## 🚀 **Quick Start**

```bash
# 1. Clone the template
git clone https://github.com/JacksonR64/1000x-app.git my-app
cd my-app

# 2. Run the intelligent setup wizard
./scripts/init-fixed-final.sh

# 3. Start developing
npm run dev
```

**That's it!** The setup script will guide you through everything else with intelligent prompts and validation.

---

## 🔧 **Initialization Script Guide**

Our smart setup script (`./scripts/init-fixed-final.sh`) provides a guided, error-free setup experience:

### **What It Does:**
- ✅ **Environment Setup**: Creates `.env` with guided prompts and direct links to get API keys
- ✅ **API Key Validation**: Detects placeholder/fake keys and validates real key formats
- ✅ **GitHub Secrets Upload**: Automatically uploads your secrets to GitHub repository
- ✅ **Memory Bank Setup**: Creates structured markdown files for persistent AI context
- ✅ **MCP Integration**: Configures TaskMaster-AI, Context7, and Supabase MCP tools
- ✅ **Final Validation**: Comprehensive report of what's working and what needs attention

### **User Experience Features:**
- 🎯 **Smart Defaults**: Press Enter for "yes" on all prompts (follows natural setup flow)
- 🔍 **Intelligent Validation**: Catches common mistakes like "test", "key", wrong formats
- 📝 **Clear Guidance**: Direct links to get each API key with step-by-step instructions
- 🔄 **Reprompt on Errors**: Automatically asks again for invalid keys until fixed
- ⚡ **Skip Optional Keys**: Leave blank to skip any optional configurations

### **Script Workflow:**
1. **Environment Setup** → Creates `.env` with interactive prompts
2. **Secrets Management** → Uploads to GitHub (handles duplicate key restrictions)
3. **Memory Bank** → Sets up persistent AI context files
4. **MCP Integration** → Configures AI development tools
5. **Final Report** → Shows status and next steps

---

## 🔑 **API Keys & Environment Variables**

### **✅ Required Keys (Core Functionality)**

| Variable | Purpose | Where to Get | Format |
|----------|---------|--------------|---------|
| `SUPABASE_URL` | Database connection | [Supabase Dashboard](https://supabase.com/dashboard/project/_/settings/api) | `https://[id].supabase.co` |
| `SUPABASE_ANON_KEY` | Client-side database access | [Supabase Dashboard](https://supabase.com/dashboard/project/_/settings/api) | JWT token (100+ chars) |
| `SUPABASE_SERVICE_ROLE_KEY` | Admin database operations | [Supabase Dashboard](https://supabase.com/dashboard/project/_/settings/api) | JWT token (100+ chars) |
| `OPENAI_API_KEY` | OpenAI models (GPT-4, etc.) | [OpenAI Platform](https://platform.openai.com/api-keys) | `sk-proj-...` or `sk-...` |
| `ANTHROPIC_API_KEY` | Claude models + TaskMaster MCP | [Anthropic Console](https://console.anthropic.com/settings/keys) | `sk-ant-...` |
| `GITHUB_TOKEN` | GitHub integration, secrets upload | [GitHub Settings](https://github.com/settings/tokens) | Fine-grained PAT (20+ chars) |

### **⚡ Optional Keys (Enhanced Features)**

| Variable | Purpose | Default | Notes |
|----------|---------|---------|-------|
| `NEXT_PUBLIC_APP_URL` | App's public URL | `http://localhost:3000` | Change for production |
| `VERCEL_TOKEN` | Vercel deployment | - | Only needed for Vercel |
| `VERCEL_ORG_ID` | Vercel organization | - | Found in account settings |
| `VERCEL_PROJECT_ID` | Vercel project | - | Found in project settings |
| `SUPABASE_ACCESS_TOKEN` | Supabase MCP agent | - | Only for Supabase MCP |

### **❌ Keys You DON'T Need**

Our script **won't ask** for these common misconceptions:
- ❌ `TASKMASTER_API_KEY` → Uses your `ANTHROPIC_API_KEY`
- ❌ `CONTEXT7_API_KEY` → No API key required
- ❌ `MEMORYBANK_API_KEY` → Uses local markdown files only

---

## 🤖 **MCP Integration (Model Context Protocol)**

Ready for Cursor IDE with sophisticated AI development tools:

### **🧠 TaskMaster-AI**
- **Purpose**: Breaks down features into manageable subtasks
- **API Key**: Uses your `ANTHROPIC_API_KEY` (no separate key needed)
- **Features**: Project planning, task decomposition, progress tracking

### **📚 Context7**
- **Purpose**: Provides up-to-date documentation for any library/framework
- **API Key**: None required
- **Features**: Real-time docs, code examples, version-specific info

### **🗄️ Supabase MCP**
- **Purpose**: Direct database operations from Cursor IDE
- **API Key**: Optional `SUPABASE_ACCESS_TOKEN` for advanced features
- **Features**: Schema management, data queries, migration assistance

### **Configuration Location**
All MCP settings are stored in `.cursor/mcp.json` and automatically configured by the setup script.

---

## 🧠 **Memory Bank System**

Persistent AI context through structured markdown files in `/memory-bank/`:

| File | Purpose |
|------|---------|
| `projectbrief.md` | Mission, success criteria, scope |
| `productContext.md` | Target users, pain points, UX goals |
| `techContext.md` | Tech stack, dependencies, versions |
| `systemPatterns.md` | Architecture, design decisions |
| `activeContext.md` | Current focus, work in progress, blockers |
| `progress.md` | Development journal, rolling updates |
| `scratchpad.md` | Ideas, snippets, experimental prompts |

**Benefits**: Your AI assistant remembers project context across sessions, leading to more relevant suggestions and faster development.

---

## 🧪 **Testing Your Setup**

### **Quick Validation Test**
```bash
# Run setup and just press Enter for all prompts
./scripts/init-fixed-final.sh
# Should complete without errors and default to "yes" for all steps
```

### **Individual Component Tests**

**Test Environment Setup:**
```bash
./scripts/env-setup.sh
# Try both guided and manual modes
```

**Test Memory Bank:**
```bash
./scripts/memory-bank.sh
# Should create 7 markdown files in memory-bank/
```

**Test API Key Validation:**
```bash
# Try various inputs: empty, "test", "key", malformed keys, real keys
# Script should catch fakes and guide you to correct formats
```

### **Expected Behaviors**
- ✅ **Enter Key**: Defaults to "yes" for all setup prompts
- ✅ **y/n Format**: All prompts use consistent yes/no format (no more 1/2 options)
- ✅ **Smart Validation**: Catches placeholder keys like "test", "key", "invalid"
- ✅ **Single Prompts**: No duplicate questions about the same setup step
- ✅ **Clear Defaults**: `[y]` indicator shows what Enter will do

### **Troubleshooting**

**Script Permission Error:**
```bash
chmod +x ./scripts/*.sh
```

**API Key Validation Issues:**
- Make sure OpenAI keys start with `sk-` (project keys) or `sk-proj-`
- Anthropic keys should start with `sk-ant-`
- GitHub tokens should be 20+ characters (fine-grained PAT recommended)

**Missing Files:**
```bash
# Re-run setup to recreate any missing files
./scripts/init-fixed-final.sh
```

---

## 📁 **Project Structure**

```text
1000x-app/
├── 📁 .cursor/                 # MCP configuration for Cursor IDE
│   └── mcp.json               # AI tools configuration
├── 📁 .github/workflows/      # CI/CD automation
│   └── ci.yml                 # Test and deploy pipeline
├── 📁 scripts/                # Setup and utility scripts
│   ├── init-fixed-final.sh    # Main setup wizard
│   ├── env-setup.sh          # Environment configuration
│   ├── memory-bank.sh        # AI context setup
│   └── setup-*.sh            # Individual MCP tool setup
├── 📁 memory-bank/            # Persistent AI context
│   ├── projectbrief.md       # Mission and scope
│   ├── productContext.md     # User and UX context
│   ├── techContext.md        # Technical details
│   └── ...                   # Additional context files
├── 📁 src/                    # Next.js application code
├── 📁 e2e/                    # Playwright test specs
├── .env.example               # Environment template
├── playwright.config.ts       # E2E test configuration
└── package.json              # Dependencies and scripts
```

---

## 🛠️ **Development Commands**

| Command | Purpose |
|---------|---------|
| `npm run dev` | Start development server |
| `npm run build` | Build for production |
| `npm run test:e2e` | Run Playwright tests |
| `npm run lint` | Lint and type-check |
| `./scripts/init-fixed-final.sh` | Re-run setup wizard |
| `./scripts/env-setup.sh` | Update environment variables |

---

## 🚀 **Deployment**

### **Automatic GitHub Secrets**
The setup script automatically uploads your environment variables as GitHub secrets, enabling seamless CI/CD deployment.

### **Vercel Deployment**
```bash
# If you provided Vercel tokens during setup
vercel --prod

# Or connect your GitHub repo to Vercel dashboard
# Secrets are already configured via GitHub
```

### **CI/CD Pipeline**
Automatically runs on every push:
- ✅ Install dependencies
- ✅ Run type checking
- ✅ Execute Playwright tests
- ✅ Deploy on success (if configured)

---

## 🎯 **What's Next?**

After setup completion:

1. **Start Developing**: `npm run dev` and open http://localhost:3000
2. **Configure Cursor IDE**: Your MCP tools are ready to use
3. **Update Memory Bank**: Edit `/memory-bank/` files with your project details
4. **Write Tests**: Add Playwright specs to `/e2e/`
5. **Deploy**: Push to GitHub and watch automatic deployment

---

## 🤝 **Contributing**

1. Fork the repository
2. Create a feature branch
3. Run the test suite: `npm run test:e2e`
4. Commit with conventional commit format: `feat: add new feature`
5. Push and create a Pull Request

---

## 📜 **License**

MIT License - see [LICENSE](LICENSE) for details.

---

## 🙏 **Acknowledgments**

Built with:
- [Next.js 15](https://nextjs.org/) - React framework
- [Supabase](https://supabase.com/) - Backend as a service  
- [TypeScript](https://www.typescriptlang.org/) - Type safety
- [Tailwind CSS 4](https://tailwindcss.com/) - Styling
- [Playwright](https://playwright.dev/) - E2E testing
- [Model Context Protocol](https://modelcontextprotocol.io/) - AI tool integration

---

**Ready to build something amazing? Run `./scripts/init-fixed-final.sh` and let's get started! 🚀**