#!/bin/bash

# Deploy script for Quarto website to GitHub Pages

set -e  # Exit on any error

# Make sure we're on the main branch
if [ "$(git branch --show-current)" != "main" ]; then
    echo "❌ Error: You must be on the main branch to deploy. Current branch: $(git branch --show-current)"
    exit 1
fi

# Check if there are uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "❌ Error: You have uncommitted changes. Please commit or stash them first."
    git status
    exit 1
fi

echo "🔄 Rendering Quarto website..."
quarto render

if [ $? -ne 0 ]; then
    echo "❌ Render failed. Exiting."
    exit 1
fi

echo "📁 Backing up rendered site..."
rm -rf /tmp/site_backup
cp -r _site /tmp/site_backup

echo "🌿 Switching to gh-pages branch..."
git checkout gh-pages

echo "🧹 Cleaning gh-pages branch..."
find . -maxdepth 1 ! -name '.' ! -name '..' ! -name '.git' ! -name '.nojekyll' -exec rm -rf {} +

echo "📋 Copying new site content..."
cp -r /tmp/site_backup/* .
touch .nojekyll

echo "📝 Committing changes..."
git add .
git commit -m "Deploy website: $(date)"

echo "🚀 Pushing to GitHub..."
git push origin gh-pages

echo "🔄 Switching back to main branch..."
git checkout main

echo "🧹 Cleaning up temporary files..."
rm -rf /tmp/site_backup

echo "✅ Deployment complete! Your site should be available at https://suryajith.github.io" 