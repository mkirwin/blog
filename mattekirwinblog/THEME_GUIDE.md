# 🎨 Theme Guide for mattekir.win

## Available Themes

### 🌸 Catppuccin Mocha (Currently Active)
- **Aesthetic**: Warm, cozy, and soothing
- **Background**: Deep purple-black (`#1e1e2e`)
- **Text**: Soft lavender (`#cdd6f4`)
- **Accent**: Beautiful blue (`#89b4fa`)
- **Perfect for**: Long reading sessions, comfortable on the eyes

### 🌙 Tokyo Night  
- **Aesthetic**: Cool, modern, and sleek
- **Background**: Deep blue-black (`#1a1b26`)
- **Text**: Cool blue-white (`#c0caf5`)
- **Accent**: Vibrant blue (`#7aa2f7`)
- **Perfect for**: Modern feel, high contrast, vibrant colors

## How to Switch Themes

### Method 1: Quick Switch (Recommended)
```bash
# For Tokyo Night:
sed -i '' 's/@import "catppuccin";/\/\/ @import "catppuccin";/' assets/_custom.scss
sed -i '' 's/\/\/ @import "tokyo-night";/@import "tokyo-night";/' assets/_custom.scss

# For Catppuccin:
sed -i '' 's/@import "tokyo-night";/\/\/ @import "tokyo-night";/' assets/_custom.scss
sed -i '' 's/\/\/ @import "catppuccin";/@import "catppuccin";/' assets/_custom.scss
```

### Method 2: Manual Edit
1. Open `assets/_custom.scss`
2. Comment/uncomment the theme import lines:
   ```scss
   // For Catppuccin:
   @import "catppuccin";
   // @import "tokyo-night";
   
   // For Tokyo Night:
   // @import "catppuccin";
   @import "tokyo-night";
   ```

### Method 3: Deploy with Theme Change
```bash
# Switch to Tokyo Night and deploy
sed -i '' 's/@import "catppuccin";/\/\/ @import "catppuccin";/' assets/_custom.scss
sed -i '' 's/\/\/ @import "tokyo-night";/@import "tokyo-night";/' assets/_custom.scss
./deploy.sh "Switch to Tokyo Night theme"

# Switch to Catppuccin and deploy  
sed -i '' 's/@import "tokyo-night";/\/\/ @import "tokyo-night";/' assets/_custom.scss
sed -i '' 's/\/\/ @import "catppuccin";/@import "catppuccin";/' assets/_custom.scss
./deploy.sh "Switch to Catppuccin theme"
```

## Preview Your Changes

### Local Preview
```bash
hugo server  # Visit http://localhost:1313
```

### Deploy to Live Site
```bash
./deploy.sh "Update to [theme name] theme"
```

## Color Palettes

### Catppuccin Mocha
```css
Base: #1e1e2e          Text: #cdd6f4
Mantle: #181825        Subtext: #bac2de  
Surface: #313244       Blue: #89b4fa
Overlay: #6c7086       Lavender: #b4befe
Purple: #cba6f7        Red: #f38ba8
Orange: #fab387        Yellow: #f9e2af
Green: #a6e3a1         Teal: #94e2d5
```

### Tokyo Night
```css
Background: #1a1b26    Foreground: #c0caf5
Dark BG: #16161e       Dark FG: #a9b1d6
Highlight: #292e42     Comment: #565f89
Blue: #7aa2f7          Purple: #bb9af7  
Red: #f7768e           Orange: #ff9e64
Yellow: #e0af68        Green: #9ece6a
Cyan: #7dcfff          Teal: #73daca
```

## Custom Features Added

- **Smooth transitions** on all interactive elements
- **Custom scrollbars** that match the theme
- **Enhanced focus states** for accessibility
- **Improved typography** with better line spacing
- **Hover effects** on links and buttons
- **Consistent color scheme** across all components

Enjoy your beautiful new theme! ✨