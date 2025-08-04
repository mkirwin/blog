# Hugo Site Deployment Guide

## 🏗️ Understanding Your Setup

Your blog uses a **Git Submodules** approach for Hugo + GitHub Pages deployment:

### Repository Structure
- **Main Repository**: `https://github.com/mkirwin/blog`
  - Contains Hugo source code, content, themes, and configuration
  - Location: `/Users/mkirwin/blog/mattekirwinblog/`

- **Public Submodule**: `https://github.com/mkirwin/mattekir.win` 
  - Contains generated static website files
  - Location: `/Users/mkirwin/blog/mattekirwinblog/public/`
  - Serves your live website at `https://mattekir.win`

### How It Works
1. Hugo generates static files in the `public/` directory
2. The `public/` directory is a separate git repository (submodule)
3. Changes are committed to both repositories separately
4. The main repository tracks which version of the public repository to use

---

## 📝 Standard Deployment Workflow

### Scenario 1: Making Content Changes (Most Common)

**When to use**: Adding new posts, editing existing content, updating starter kits, etc.

```bash
# 1. Navigate to your blog directory
cd /Users/mkirwin/blog/mattekirwinblog

# 2. Make your content changes (edit markdown files, etc.)
# ... edit your files ...

# 3. Test locally (optional but recommended)
hugo server

# 4. Build the static site
hugo --minify

# 5. Navigate to the public directory (the submodule)
cd public

# 6. Check what changed in the generated site
git status
git diff

# 7. Add and commit changes to the public repository
git add .
git commit -m "Deploy content updates"

# 8. Push to GitHub Pages
git push origin main

# 9. Return to main repository
cd ..

# 10. Commit your source changes to main repository
git add .
git commit -m "Update content: [describe your changes]"

# 11. Update the submodule reference to point to latest public commit
git add public
git commit -m "Update public submodule to latest deployment"

# 12. Push main repository changes
git push origin main
```

### Scenario 2: Only Changed Generated Files (Rare)

**When to use**: Hugo theme updates, config changes that only affect generated output

```bash
# 1. Navigate to blog directory and build
cd /Users/mkirwin/blog/mattekirwinblog
hugo --minify

# 2. Deploy the public changes
cd public
git add .
git commit -m "Deploy generated file updates"
git push origin main

# 3. Update main repository submodule reference
cd ..
git add public
git commit -m "Update public submodule"
git push origin main
```

### Scenario 3: Only Changed Source Files (Common)

**When to use**: Updated content but haven't built yet, config changes, added new themes

```bash
# 1. Navigate to blog directory
cd /Users/mkirwin/blog/mattekirwinblog

# 2. Commit source changes first
git add .
git commit -m "Update source: [describe changes]"

# 3. Build and deploy
hugo --minify
cd public
git add .
git commit -m "Deploy latest changes"
git push origin main

# 4. Update submodule reference
cd ..
git add public
git commit -m "Update public submodule to latest deployment"
git push origin main
```

---

## 🔍 Checking Your Status

### Before Making Changes
```bash
# Check main repository status
cd /Users/mkirwin/blog/mattekirwinblog
git status

# Check public repository status  
cd public
git status
cd ..

# Check submodule status
git submodule status
```

### Understanding Submodule Status Output
```bash
# Example output:
 6dcb650b4d063c75cdde7dab69563f3ccc2400b3 public (heads/main)
#  ^                                        ^      ^
#  |                                        |      |
#  Current commit hash                      Dir    Branch
```

- **Space prefix** = submodule is up to date
- **+** prefix = submodule has new commits available
- **-** prefix = submodule is not initialized

---

## 🚨 Troubleshooting Common Issues

### Issue: "modified: public (new commits)"
**Meaning**: The public submodule has new commits that the main repository doesn't know about.

**Solution**:
```bash
# Add the updated submodule reference
git add public
git commit -m "Update public submodule"
git push origin main
```

### Issue: "Changes not staged for commit"
**Meaning**: You have uncommitted changes in your source files.

**Solution**:
```bash
# Review what changed
git status
git diff

# Commit the changes
git add .
git commit -m "Describe your changes"
```

### Issue: Public directory is empty or missing
**Meaning**: Submodule isn't properly initialized.

**Solution**:
```bash
# Initialize and update submodules
git submodule update --init --recursive
```

### Issue: Hugo build fails
**Solution**:
```bash
# Check for errors
hugo --verbose

# Common fixes:
# - Check config.toml syntax
# - Ensure all required themes are present
# - Check for broken markdown syntax
```

---

## 🎯 Quick Commands Reference

### Essential Commands
```bash
# Build site
hugo --minify

# Test locally
hugo server

# Check status of everything
git status && cd public && git status && cd ..

# Full deployment (after making changes)
hugo --minify && cd public && git add . && git commit -m "Deploy updates" && git push && cd .. && git add . && git commit -m "Update content and submodule" && git push
```

### Useful Git Commands
```bash
# See recent commits in main repo
git log --oneline -5

# See recent commits in public repo
cd public && git log --oneline -5 && cd ..

# Undo last commit (if not pushed yet)
git reset --soft HEAD~1

# Force sync submodule to remote
git submodule update --remote public
```

---

## 📁 Directory Structure Reminder

```
/Users/mkirwin/blog/mattekirwinblog/
├── content/                    # Your blog posts and pages
│   ├── starter-kits/
│   │   ├── foraging.md        # The page you just updated!
│   │   ├── sourdough.md
│   │   └── digital-intentionalism.md
│   └── docs/
├── public/                     # SUBMODULE: Generated site files
│   ├── starter-kits/
│   ├── index.html
│   └── ... (all generated HTML/CSS/JS)
├── themes/                     # Hugo themes
├── config.toml                 # Hugo configuration
├── hugo.toml                   # Additional Hugo config
└── DEPLOYMENT_GUIDE.md         # This file!
```

---

## ✅ Best Practices

1. **Always build before deploying**: Run `hugo --minify` to ensure fresh content
2. **Test locally first**: Use `hugo server` to preview changes
3. **Commit source changes first**: Keep your source code versioned
4. **Use descriptive commit messages**: Help future you understand what changed
5. **Check status regularly**: Run `git status` to understand current state
6. **Deploy completely**: Don't forget to update the submodule reference

---

## 🔗 Your Repository URLs

- **Main Repository (source)**: https://github.com/mkirwin/blog
- **Public Repository (live site)**: https://github.com/mkirwin/mattekir.win  
- **Live Website**: https://mattekir.win

Happy blogging! 🎉