#!/bin/bash

# Hugo Site Deployment Script
# Usage: ./deploy.sh "Your commit message"

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default commit message
COMMIT_MSG="${1:-Update site content}"

echo -e "${BLUE}🚀 Starting Hugo site deployment...${NC}"
echo -e "${YELLOW}Commit message: ${COMMIT_MSG}${NC}"

# Check if we're in the right directory
if [ ! -f "hugo.toml" ] && [ ! -f "config.toml" ]; then
    echo -e "${RED}❌ Error: Not in Hugo site directory${NC}"
    echo "Please run this script from your Hugo site root directory"
    exit 1
fi

# Step 1: Check for uncommitted changes in main repo
echo -e "\n${BLUE}📋 Checking main repository status...${NC}"
if ! git diff-index --quiet HEAD --; then
    echo -e "${YELLOW}📝 Committing source changes...${NC}"
    git add .
    git commit -m "$COMMIT_MSG"
else
    echo -e "${GREEN}✅ No uncommitted source changes${NC}"
fi

# Step 2: Build the site
echo -e "\n${BLUE}🏗️  Building Hugo site...${NC}"
hugo --minify

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Hugo build failed!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Hugo build successful${NC}"

# Step 3: Deploy to public repository
echo -e "\n${BLUE}📤 Deploying to GitHub Pages...${NC}"
cd public

# Check if there are changes in public
if git diff-index --quiet HEAD --; then
    echo -e "${YELLOW}⚠️  No changes in generated files${NC}"
    CHANGES_DEPLOYED=false
else
    echo -e "${YELLOW}📝 Committing generated files...${NC}"
    git add .
    git commit -m "Deploy: $COMMIT_MSG"
    
    echo -e "${YELLOW}🌐 Pushing to GitHub Pages...${NC}"
    git push origin main
    
    echo -e "${GREEN}✅ GitHub Pages updated${NC}"
    CHANGES_DEPLOYED=true
fi

# Step 4: Update submodule reference in main repo
echo -e "\n${BLUE}🔗 Updating submodule reference...${NC}"
cd ..

# Add the updated public submodule
git add public

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo -e "${GREEN}✅ Submodule reference already up to date${NC}"
else
    git commit -m "Update public submodule to latest deployment"
    
    echo -e "${YELLOW}📤 Pushing main repository...${NC}"
    git push origin main
    
    echo -e "${GREEN}✅ Main repository updated${NC}"
fi

# Step 5: Success message
echo -e "\n${GREEN}🎉 Deployment complete!${NC}"
echo -e "${BLUE}📍 Your site is live at: https://mattekir.win${NC}"
echo -e "${BLUE}📚 Main repo: https://github.com/mkirwin/blog${NC}"
echo -e "${BLUE}🌐 Pages repo: https://github.com/mkirwin/mattekir.win${NC}"

# Optional: Show recent commits
echo -e "\n${BLUE}📜 Recent commits:${NC}"
echo -e "${YELLOW}Main repository:${NC}"
git log --oneline -3

echo -e "\n${YELLOW}Public repository:${NC}"
cd public && git log --oneline -3 && cd ..