# Quick Guide: Link GitHub to Cursor

## ✅ What's Already Done
- ✅ Git installed
- ✅ GitHub CLI installed  
- ✅ Repository initialized
- ✅ Files committed

## 🔐 Next Steps (Choose One)

### Option 1: Complete GitHub Authentication (Recommended)

1. **Open a new terminal in Cursor** (Terminal → New Terminal)

2. **Run this command:**
   ```powershell
   gh auth login
   ```

3. **Follow the prompts:**
   - Choose: `GitHub.com`
   - Choose: `HTTPS` or `SSH` (HTTPS is easier)
   - Choose: `Login with a web browser`
   - Copy the code shown
   - Press Enter (this will open your browser)
   - Paste the code in the browser
   - Authorize GitHub CLI

4. **After authentication, create and push to GitHub:**
   ```powershell
   gh repo create --public --source=. --remote=origin --push
   ```

### Option 2: Use Cursor's Built-in GitHub Integration

1. **Open Cursor Settings:**
   - Press `Ctrl+,` or go to File → Preferences → Settings

2. **Search for "GitHub"**

3. **Click "Sign in with GitHub"** and authorize in your browser

4. **Use Source Control panel:**
   - Press `Ctrl+Shift+G` to open Source Control
   - Click the "..." menu
   - Choose "Publish to GitHub"

### Option 3: Manual Setup (If you already have a GitHub repo)

1. **Create a repository on GitHub.com** (don't initialize with README)

2. **Run these commands:**
   ```powershell
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   git branch -M main
   git push -u origin main
   ```

## 🔧 Update Your Git Identity (Important!)

Before pushing, update your Git identity:

```powershell
git config --global user.name "Your Actual Name"
git config --global user.email "your.email@example.com"
```

## ✨ You're All Set!

Once authenticated, your repository will be linked to GitHub and you can use all of Cursor's GitHub features!


