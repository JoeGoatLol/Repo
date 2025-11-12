# PowerShell script to set up GitHub connection
# Run this script after installing Git

Write-Host "Setting up GitHub connection..." -ForegroundColor Green

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "✓ Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git is not installed. Please install Git first:" -ForegroundColor Red
    Write-Host "  https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Check if GitHub CLI is installed
try {
    $ghVersion = gh --version
    Write-Host "✓ GitHub CLI found" -ForegroundColor Green
} catch {
    Write-Host "⚠ GitHub CLI not found. Installing via winget..." -ForegroundColor Yellow
    winget install --id GitHub.cli --silent
}

# Initialize Git repository
if (-not (Test-Path .git)) {
    Write-Host "Initializing Git repository..." -ForegroundColor Cyan
    git init
    Write-Host "✓ Repository initialized" -ForegroundColor Green
} else {
    Write-Host "✓ Git repository already initialized" -ForegroundColor Green
}

# Configure Git (you'll need to update these)
Write-Host "`nPlease configure your Git identity:" -ForegroundColor Yellow
$userName = Read-Host "Enter your name"
$userEmail = Read-Host "Enter your email"

git config --global user.name $userName
git config --global user.email $userEmail
Write-Host "✓ Git configured" -ForegroundColor Green

# Authenticate with GitHub
Write-Host "`nAuthenticating with GitHub..." -ForegroundColor Cyan
gh auth login

# Add and commit files
Write-Host "`nAdding files..." -ForegroundColor Cyan
git add .
git commit -m "Initial commit"
Write-Host "✓ Files committed" -ForegroundColor Green

# Create GitHub repository
Write-Host "`nCreating GitHub repository..." -ForegroundColor Cyan
$repoName = Read-Host "Enter repository name (or press Enter to use current folder name)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = Split-Path -Leaf (Get-Location)
}

gh repo create $repoName --public --source=. --remote=origin --push
Write-Host "✓ Repository created and pushed to GitHub!" -ForegroundColor Green

Write-Host "`nSetup complete! Your repository is now linked to GitHub." -ForegroundColor Green

