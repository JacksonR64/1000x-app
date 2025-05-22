#!/usr/bin/env bash
set -euo pipefail

echo "🚀 1000x-App Template Setup"
echo "============================"

# Check if this is a template instantiation
if [[ -f .github/template.yml && ! -f .template-setup-complete ]]; then
    echo "📋 Customizing your new project..."
    
    # Get project details
    read -p "📝 Project name: " PROJECT_NAME
    read -p "👤 Your name: " USER_NAME
    read -p "📧 Your email: " USER_EMAIL
    read -p "📝 Project description: " PROJECT_DESC
    
    # Update package.json
    if [[ -f package.json ]]; then
        sed -i.bak "s/\"name\": \".*\"/\"name\": \"$PROJECT_NAME\"/" package.json
        sed -i.bak "s/\"description\": \".*\"/\"description\": \"$PROJECT_DESC\"/" package.json
        rm package.json.bak
        echo "✅ Updated package.json"
    fi
    
    # Mark setup as complete
    touch .template-setup-complete
    echo "✅ Template customization complete!"
else
    echo "ℹ️  Template already customized or not a fresh template"
fi

# Continue with environment setup
echo ""
echo "🔧 Setting up environment..."

# Create .env from example if it doesn't exist
if [[ ! -f .env.local ]] && [[ -f .env.example ]]; then
    cp .env.example .env.local
    echo "📄 Created .env.local from template"
    echo "⚠️  Please edit .env.local with your actual API keys"
    echo "💡 Tip: Use 'npm run secrets:push' to upload to GitHub after editing"
fi

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

echo ""
echo "🎉 Setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Edit .env.local with your API keys"
echo "2. Update memory-bank/ files with your project details"
echo "3. Create scripts/prd.txt with your requirements"
echo "4. Run 'npm run dev' to start developing"
echo ""
echo "🤖 For AI-powered task management:"
echo "   npm install -g taskmaster-ai"
echo "   taskmaster init"
echo "   taskmaster parse-prd --input=scripts/prd.txt"
