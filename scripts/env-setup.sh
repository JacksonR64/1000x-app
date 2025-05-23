#!/usr/bin/env bash
set -euo pipefail

# Define colors for better readability
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${GREEN}🔧 Environment Setup Helper${RESET}"
echo ""
echo -e "${YELLOW}How would you like to set up your environment variables?${RESET}"
echo -e "  ${BLUE}1)${RESET} Guided setup with prompts and direct links (recommended)"
echo -e "  ${BLUE}2)${RESET} Manual setup (use existing .env or edit manually)"
echo ""
read -rp "Enter your choice (1/2): " user_choice

case "$user_choice" in
  2)
    echo -e "${YELLOW}Manual setup selected.${RESET}"
    echo ""
    
    # Check if .env already exists
    if [[ -f .env ]]; then
      echo -e "${GREEN}✅ Using existing .env file.${RESET}"
    else
      # Check if .env.example exists and create it if needed
      if [[ ! -f .env.example ]]; then
        echo -e "${YELLOW}Creating .env.example template...${RESET}"
        # Create .env.example with proper formatting (explicit newlines)
        cat > .env.example << 'EOF'
# Supabase Credentials
SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# AI Model Provider Keys
OPENAI_API_KEY=
ANTHROPIC_API_KEY=

# Cursor MCP Service Keys
MEMORYBANK_API_KEY=
TASKMASTER_API_KEY=
CONTEXT7_API_KEY=

# Development & Deployment
GITHUB_TOKEN=
NEXT_PUBLIC_APP_URL=
VERCEL_TOKEN=
VERCEL_ORG_ID=
VERCEL_PROJECT_ID=
EOF
        echo -e "${GREEN}✅ Created .env.example template${RESET}"
      fi
      
      # Create .env from example if it doesn't exist, preserving line breaks
      echo -e "${YELLOW}No .env file found. Creating from .env.example...${RESET}"
      # Using cp would lose line breaks, so we create it line by line
      while IFS= read -r line || [[ -n "$line" ]]; do
        echo "$line" >> .env
      done < .env.example
      echo -e "${GREEN}✅ Created .env from template${RESET}"
    fi
    
    echo ""
    echo -e "${YELLOW}Next steps:${RESET}"
    echo -e "1. Edit the ${CYAN}.env${RESET} file with your preferred text editor"
    echo -e "2. Add the following API keys:"
    echo -e "   • ${BLUE}SUPABASE_URL${RESET}: https://supabase.com/dashboard/project/_/settings/api"
    echo -e "   • ${BLUE}SUPABASE_ANON_KEY${RESET}: https://supabase.com/dashboard/project/_/settings/api"
    echo -e "   • ${BLUE}SUPABASE_SERVICE_ROLE_KEY${RESET}: https://supabase.com/dashboard/project/_/settings/api (service_role key)"
    echo -e "   • ${BLUE}OPENAI_API_KEY${RESET}: https://platform.openai.com/api-keys"
    echo -e "   • ${BLUE}ANTHROPIC_API_KEY${RESET}: https://console.anthropic.com/settings/keys"
    echo -e "   • ${BLUE}MEMORYBANK_API_KEY${RESET}: Add from Cursor IDE or your MemoryBank provider"
    echo -e "   • ${BLUE}TASKMASTER_API_KEY${RESET}: Add from Cursor IDE or your TaskMaster provider"
    echo -e "   • ${BLUE}CONTEXT7_API_KEY${RESET}: Add from Cursor IDE or your Context7 provider"
    echo -e "   • ${BLUE}GITHUB_TOKEN${RESET}: https://github.com/settings/tokens (fine-grained PAT with repo scope)"
    echo -e "   • ${BLUE}NEXT_PUBLIC_APP_URL${RESET}: Your app's public URL (e.g., http://localhost:3000 for development)"
    echo -e "   • ${BLUE}VERCEL_TOKEN${RESET}: https://vercel.com/account/tokens"
    echo -e "   • ${BLUE}VERCEL_ORG_ID${RESET}: https://vercel.com/account"
    echo -e "   • ${BLUE}VERCEL_PROJECT_ID${RESET}: Available in your Vercel project settings"
    echo ""
    echo -e "${YELLOW}When you're done editing the .env file, you can run:${RESET}"
    echo -e "  ${CYAN}./scripts/env-setup.sh${RESET}"
    echo -e "And choose option 1 to upload your keys to GitHub."
    
    echo ""
    read -rp "Would you like to upload your secrets to GitHub now? (y/n): " upload_now
    if [[ "$upload_now" == "y" || "$upload_now" == "Y" ]]; then
      # Proceed to the GitHub upload section
      echo -e "${YELLOW}Proceeding to upload secrets to GitHub...${RESET}"
    else
      echo -e "${GREEN}✅ Setup complete. Edit your .env file when ready.${RESET}"
      exit 0
    fi
    ;;
  1|*)
    echo -e "${YELLOW}Guided setup selected.${RESET}"
    echo ""
    echo -e "${GREEN}✅ Creating .env file with guided prompts${RESET}"
    echo ""
    
    # Create .env file with guided prompts
    echo "# Supabase Credentials" > .env
    echo -e "${BLUE}=== SUPABASE CREDENTIALS ===${RESET}"
    echo -e "${YELLOW}SUPABASE_URL${RESET} - Your Supabase project URL"
    echo -e "→ Get from: ${CYAN}https://supabase.com/dashboard/project/_/settings/api${RESET}"
    read -rp "Enter SUPABASE_URL: " SUPABASE_URL
    echo "SUPABASE_URL=$SUPABASE_URL" >> .env
    
    echo -e "${YELLOW}SUPABASE_ANON_KEY${RESET} - Anonymous API key"
    read -rp "Enter SUPABASE_ANON_KEY: " SUPABASE_ANON_KEY
    echo "SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY" >> .env
    
    echo -e "${YELLOW}SUPABASE_SERVICE_ROLE_KEY${RESET} - Service role key"
    read -rp "Enter SUPABASE_SERVICE_ROLE_KEY: " SUPABASE_SERVICE_ROLE_KEY
    echo "SUPABASE_SERVICE_ROLE_KEY=$SUPABASE_SERVICE_ROLE_KEY" >> .env
    echo "" >> .env
    
    echo "# AI API Keys" >> .env
    echo -e "${BLUE}=== AI API KEYS ===${RESET}"
    echo -e "${YELLOW}OPENAI_API_KEY${RESET} - OpenAI API key"
    echo -e "→ Get from: ${CYAN}https://platform.openai.com/api-keys${RESET}"
    read -rp "Enter OPENAI_API_KEY: " OPENAI_API_KEY
    echo "OPENAI_API_KEY=$OPENAI_API_KEY" >> .env
    
    echo -e "${YELLOW}ANTHROPIC_API_KEY${RESET} - Anthropic API key"
    echo -e "→ Get from: ${CYAN}https://console.anthropic.com/settings/keys${RESET}"
    read -rp "Enter ANTHROPIC_API_KEY: " ANTHROPIC_API_KEY
    echo "ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY" >> .env
    echo "" >> .env
    
    echo "# Optional Keys" >> .env
    echo -e "${BLUE}=== OPTIONAL KEYS ===${RESET}"
    echo -e "${YELLOW}GITHUB_TOKEN${RESET} - GitHub token (optional)"
    read -rp "Enter GITHUB_TOKEN (or press Enter to skip): " GITHUB_TOKEN
    echo "GITHUB_TOKEN=$GITHUB_TOKEN" >> .env
    
    echo -e "${GREEN}✅ .env file created successfully!${RESET}"
    ;;
esac

echo ""
echo -e "${GREEN}✅ Environment setup complete!${RESET}"
echo -e "${CYAN}💡 TIP: Edit .env with your actual API keys when ready${RESET}"
