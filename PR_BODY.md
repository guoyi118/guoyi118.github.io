# PR: Add Smooth Light/Dark Theme Toggle

## Description
This PR adds a smooth light/dark theme toggle feature to the personal website with:

### Features
- 🌗 **Theme Toggle Button** - Fixed position sun/moon button in top-right corner
- 🎨 **CSS Variables** - Clean theming system for easy customization
- ⚡ **Smooth Transitions** - 400ms cubic-bezier transitions for all color changes
- 💾 **Persistence** - Saves theme preference to localStorage
- 🔄 **System Preference** - Respects OS dark mode setting by default
- ♿ **Accessible** - Proper ARIA labels and keyboard support

### Changes Made
- Added CSS custom properties (`:root` and `[data-theme="dark"]`)
- Implemented theme toggle button with sun/moon icons
- Added JavaScript for theme switching logic
- Updated all color references to use CSS variables
- Applied smooth transitions to all themeable elements

### Files Changed
- `index.html` - Added theme toggle styles, button, and JavaScript

## Testing
1. Click the theme toggle button to switch between light/dark modes
2. Verify smooth color transitions
3. Refresh the page - theme should persist
4. Toggle system dark mode and refresh - should respect system preference

---

## Commands to Create PR

```bash
cd /root/.openclaw/workspace/theme-toggle

# Push the branch
git push -u origin feature/theme-toggle

# Then create PR using GitHub CLI (if authenticated):
gh pr create \
  --title "Add smooth light/dark theme toggle" \
  --body-file /root/.openclaw/workspace/theme-toggle/PR_BODY.md \
  --base main \
  --head feature/theme-toggle
```

Or create PR manually at:
https://github.com/guoyi118/guoyi118.github.io/compare/main...feature/theme-toggle
