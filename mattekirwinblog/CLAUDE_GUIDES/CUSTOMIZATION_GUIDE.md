# 🎨 Customization Guide for mattekir.win

## 📁 **Your Customizable Files & Directories**

### 🎯 **Quick Start - Files You Can Safely Edit:**

```
mattekirwinblog/
├── assets/                    # 🎨 Your custom styling (SAFE TO EDIT)
│   ├── _custom.scss          # Main custom styles
│   ├── _catppuccin.scss      # Catppuccin theme
│   └── _tokyo-night.scss     # Tokyo Night theme
├── static/                   # 🖼️ Images, icons, files (SAFE TO EDIT)
│   └── (add your files here!)
├── layouts/                  # 🏗️ Custom HTML templates (SAFE TO EDIT)
│   └── (override theme templates here)
├── content/                  # 📝 Your blog content (SAFE TO EDIT)
│   ├── starter-kits/
│   └── docs/
├── data/                     # 📊 Configuration data (SAFE TO EDIT)
└── config.toml              # ⚙️ Site configuration (SAFE TO EDIT)
```

## 🖼️ **Adding Cute Graphics & Images**

### **Step 1: Create your images directory**
```bash
mkdir -p static/images
mkdir -p static/icons
mkdir -p static/graphics
```

### **Step 2: Add your graphics**
Put your images in `static/` - they'll be available at the root of your site:
- `static/images/cute-mushroom.png` → `https://mattekir.win/images/cute-mushroom.png`
- `static/icons/foraging-icon.svg` → `https://mattekir.win/icons/foraging-icon.svg`

### **Step 3: Use in your content**
```markdown
![Cute mushroom](/images/cute-mushroom.png)

<!-- Or with HTML for more control -->
<img src="/graphics/foraging-banner.png" alt="Foraging Banner" style="width: 100%; border-radius: 8px;">
```

## 🎨 **Custom Styling Options**

### **In `assets/_custom.scss`, you can add:**

```scss
// 🌟 Fun hover effects
.book-menu a:hover {
  transform: translateX(5px);
  transition: transform 0.2s ease;
}

// 🎈 Cute buttons
.cute-button {
  background: linear-gradient(45deg, #ff6b6b, #feca57);
  border: none;
  border-radius: 20px;
  padding: 10px 20px;
  color: white;
  cursor: pointer;
  box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
  
  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(255, 107, 107, 0.6);
  }
}

// 🍄 Custom list styling
.foraging-list {
  li::before {
    content: "🍄";
    margin-right: 8px;
  }
}

// ✨ Sparkle animations
@keyframes sparkle {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

.sparkle {
  animation: sparkle 2s ease-in-out infinite;
}

// 🌿 Custom borders
.nature-box {
  border: 2px solid var(--color-link);
  border-radius: 12px;
  padding: 20px;
  background: linear-gradient(135deg, 
    rgba(var(--color-link), 0.1) 0%, 
    rgba(var(--color-link), 0.05) 100%);
}
```

## 🏗️ **Custom HTML Templates (Advanced)**

### **Override theme templates by creating:**
```
layouts/
├── _default/
│   ├── baseof.html          # Main page structure
│   ├── single.html          # Individual page layout
│   └── list.html            # List pages layout
├── partials/
│   ├── header.html          # Custom header
│   ├── footer.html          # Custom footer
│   └── cute-graphics.html   # Your custom graphics partial
└── shortcodes/
    ├── cute-box.html        # Custom content boxes
    └── foraging-tip.html    # Special foraging tips
```

## 🎪 **Fun Customization Ideas**

### **1. Animated Header**
```scss
.book-brand {
  background: linear-gradient(45deg, #ff6b6b, #4ecdc4, #45b7d1);
  background-size: 300% 300%;
  animation: gradient 3s ease infinite;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

@keyframes gradient {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}
```

### **2. Cute Loading Animation**
```scss
.loading-mushroom {
  font-size: 2rem;
  animation: bounce 1s infinite;
}

@keyframes bounce {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}
```

### **3. Custom Scrollbar**
```scss
::-webkit-scrollbar {
  width: 12px;
}

::-webkit-scrollbar-track {
  background: var(--body-background);
  border-radius: 10px;
}

::-webkit-scrollbar-thumb {
  background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
  border-radius: 10px;
  
  &:hover {
    background: linear-gradient(45deg, #ff5252, #26a69a);
  }
}
```

### **4. Floating Action Button**
```scss
.fab {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 60px;
  height: 60px;
  background: linear-gradient(45deg, #ff6b6b, #feca57);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.3);
  cursor: pointer;
  z-index: 1000;
  
  &:hover {
    transform: scale(1.1);
    box-shadow: 0 6px 25px rgba(0,0,0,0.4);
  }
}
```

## 🧩 **Custom Shortcodes for Content**

### **Create `layouts/shortcodes/foraging-tip.html`:**
```html
<div class="foraging-tip nature-box">
  <h4>🌿 Foraging Tip</h4>
  <p>{{ .Inner }}</p>
</div>
```

### **Use in your markdown:**
```markdown
{{< foraging-tip >}}
Always bring three forms of identification when foraging!
{{< /foraging-tip >}}
```

## 🎁 **Recommended Graphics to Add**

1. **Favicon**: `static/favicon.ico` (your site icon)
2. **Logo**: `static/images/logo.png` 
3. **Background patterns**: `static/images/pattern.svg`
4. **Section dividers**: `static/graphics/divider.png`
5. **Icon set**: `static/icons/` (mushroom, leaf, basket, etc.)

## 🚀 **Implementation Steps**

1. **Add graphics**: Put images in `static/`
2. **Update styles**: Edit `assets/_custom.scss`
3. **Test locally**: `hugo server`
4. **Deploy**: `./deploy.sh "Add cute customizations"`

## 🎨 **Color Palette Suggestions**

### **Nature Theme:**
```scss
--forest-green: #2d5a27;
--moss-green: #8fbc8f;
--mushroom-brown: #8b4513;
--berry-red: #dc143c;
--sky-blue: #87ceeb;
```

### **Cottage Core:**
```scss
--cream: #f5f5dc;
--sage: #9caf88;
--terracotta: #e2725b;
--lavender: #e6e6fa;
--warm-brown: #d2b48c;
```

Ready to make your site absolutely adorable? Which customization appeals to you most? 🌟