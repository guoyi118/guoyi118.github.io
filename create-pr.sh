#!/bin/bash

# Theme Toggle PR Automation Script
# Usage: ./create-pr.sh [GITHUB_TOKEN]

TOKEN=${1:-$GITHUB_TOKEN}

if [ -z "$TOKEN" ]; then
  echo "Error: GitHub token required"
  echo "Usage: ./create-pr.sh [GITHUB_TOKEN]"
  echo "Or set GITHUB_TOKEN environment variable"
  exit 1
fi

REPO="guoyi118/guoyi118.github.io"
BRANCH="feature/theme-toggle"

echo "🚀 Pushing branch..."
git push -u https://$TOKEN@github.com/$REPO.git $BRANCH

if [ $? -ne 0 ]; then
  echo "❌ Push failed"
  exit 1
fi

echo "✅ Branch pushed successfully"
echo ""
echo "📝 Creating Pull Request..."

# Create PR using GitHub API
curl -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO/pulls \
  -d '{
    "title": "Add smooth light/dark theme toggle",
    "body": "This PR adds a smooth light/dark theme toggle feature:\n\n### Features\n- 🌗 Theme toggle button with sun/moon icons\n- 🎨 CSS variables for easy theming\n- ⚡ 400ms smooth transitions\n- 💾 Theme persistence via localStorage\n- 🔄 Respects OS system preference\n\n### Changes\n- Added CSS custom properties for light/dark themes\n- Implemented theme toggle button (top-right corner)\n- Updated all colors to use CSS variables\n- Added smooth transitions to all themeable elements\n\n### Testing\n1. Click toggle button - should switch themes smoothly\n2. Theme persists after page refresh\n3. Respects system dark mode preference",
    "base": "main",
    "head": "'"$BRANCH"'"
  }'

echo ""
echo "✅ PR creation request sent!"
