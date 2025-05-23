#!/usr/bin/env bash
set -euo pipefail

echo "🚀 1000x-App Comprehensive Setup"
echo "================================="
echo ""

# Modern y/n prompt function with intelligent defaults  
ask_yn() {
    local prompt="$1"
    local default="${2:-y}"
    local response
    
    if [[ "$default" == "y" ]]; then
        read -p "$prompt (y/n) [y]: " response
        response=${response:-y}
    else
        read -p "$prompt (y/n) [n]: " response  
        response=${response:-n}
    fi
    
    case "$response" in
        [Yy]|[Yy][Ee][Ss]) return 0 ;;
        [Nn]|[Nn][Oo]) return 1 ;;
        *) echo "Please enter y or n"; ask_yn "$prompt" "$default" ;;
    esac
}

SCRIPTS_DIR="$(dirname "$0")"

echo "This comprehensive setup wizard will configure:"
echo "• Environment variables and API keys"
echo "• Memory bank for AI context"
echo "• MCP tools for Cursor IDE"
echo "• GitHub secrets management"
echo ""

# STEP 1: Environment Setup
echo "🔧 ENVIRONMENT SETUP"
if ask_yn "Set up environment variables with guided prompts"; then
    if [[ -f "$SCRIPTS_DIR/env-setup.sh" ]]; then
        echo "🔧 Running environment setup..."
        bash "$SCRIPTS_DIR/env-setup.sh"
    else
        echo "⚠️ env-setup.sh not found"
    fi
else
    echo "⏭️ Skipping environment setup"
fi

echo ""

# STEP 2: Memory Bank Setup  
echo "🧠 MEMORY BANK SETUP"
if ask_yn "Create memory bank with starter context files"; then
    if [[ -f "$SCRIPTS_DIR/memory-bank.sh" ]]; then
        echo "🔧 Setting up memory bank..."
        bash "$SCRIPTS_DIR/memory-bank.sh"
    else
        echo "⚠️ memory-bank.sh not found"
    fi
else
    echo "⏭️ Skipping memory bank setup"
fi

echo ""

# STEP 3: MCP Tools Setup
echo "🤖 MCP INTEGRATION SETUP"

# TaskMaster-AI  
if ask_yn "Set up TaskMaster-AI MCP for project management"; then
    if [[ -f "$SCRIPTS_DIR/setup-taskmaster-ai.sh" ]]; then
        echo "🔧 Setting up TaskMaster-AI MCP..."
        bash "$SCRIPTS_DIR/setup-taskmaster-ai.sh"
    else
        echo "⚠️ setup-taskmaster-ai.sh not found"
    fi
else
    echo "⏭️ Skipping TaskMaster-AI MCP setup"
fi

echo ""

# Context7
if ask_yn "Set up Context7 MCP for documentation access"; then
    if [[ -f "$SCRIPTS_DIR/setup-context7.sh" ]]; then
        echo "🔧 Setting up Context7 MCP..."
        bash "$SCRIPTS_DIR/setup-context7.sh"
    else
        echo "⚠️ setup-context7.sh not found"
    fi
else
    echo "⏭️ Skipping Context7 MCP setup"
fi

echo ""

# Supabase MCP
if ask_yn "Set up Supabase MCP for database operations"; then
    if [[ -f "$SCRIPTS_DIR/setup-supabase.sh" ]]; then
        echo "🔧 Setting up Supabase MCP..."
        bash "$SCRIPTS_DIR/setup-supabase.sh"
    else
        echo "⚠️ setup-supabase.sh not found"
    fi
else
    echo "⏭️ Skipping Supabase MCP setup"
fi

echo ""
echo "🎉 Setup Complete!"
echo ""
echo "📋 Next Steps:"
echo "1. Edit .env.local with your actual API keys"
echo "2. Update memory-bank/ files with your project context"
echo "3. Create scripts/prd.txt with your requirements"
echo "4. Run 'npm run dev' to start developing"
echo ""
echo "🤖 For AI-powered task management:"
echo "   npm install -g taskmaster-ai"
echo "   taskmaster init"
echo "   taskmaster parse-prd --input=scripts/prd.txt"
echo ""
echo "✅ Your AI-first development environment is ready!"
