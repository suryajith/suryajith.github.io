#!/bin/bash

# Script to check repository status and branch setup

echo "📊 Repository Status Check"
echo "=========================="

echo "📁 Current directory: $(pwd)"
echo "🌿 Current branch: $(git branch --show-current)"

echo ""
echo "📋 Branches:"
git branch -a

echo ""
echo "🔗 Remote URLs:"
git remote -v

echo ""
echo "📝 Recent commits on current branch:"
git log --oneline -5

echo ""
echo "📂 Current directory contents:"
if [ "$(git branch --show-current)" = "main" ]; then
    echo "✅ On main branch - should see source files (.qmd, _quarto.yml, deploy.sh):"
    ls -la | grep -E "\.(qmd|yml)$|deploy\.sh|README\.md" || echo "❌ Missing source files!"
else
    echo "ℹ️  On $(git branch --show-current) branch - contents:"
    ls -la | head -10
fi

echo ""
echo "🚀 Git status:"
git status --short 