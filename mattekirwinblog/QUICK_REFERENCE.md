# 🚀 Quick Deployment Reference

## Super Simple Deployment (Most Common)
```bash
./deploy.sh "Your commit message here"
```

## Manual Step-by-Step
```bash
# 1. Build site
hugo --minify

# 2. Deploy public files
cd public && git add . && git commit -m "Deploy updates" && git push && cd ..

# 3. Update main repo
git add . && git commit -m "Update content and submodule" && git push
```

## Quick Status Check
```bash
git status && cd public && git status && cd ..
```

## Test Locally Before Deploying
```bash
hugo server  # Visit http://localhost:1313
```

## Your Repositories
- **Main**: https://github.com/mkirwin/blog
- **Live Site**: https://github.com/mkirwin/mattekir.win → https://mattekir.win

## Troubleshooting
- **"modified: public (new commits)"** → Run: `git add public && git commit -m "Update submodule" && git push`
- **Hugo build fails** → Run: `hugo --verbose` to see errors
- **Changes not deploying** → Check both repos are pushed: `git log --oneline -3` and `cd public && git log --oneline -3`