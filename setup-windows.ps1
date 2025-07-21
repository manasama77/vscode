# Laravel Development Workspace Setup Script for Windows
# Run this script in PowerShell as Administrator

Write-Host "=== Laravel Development Workspace Setup ===" -ForegroundColor Green

# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as Administrator!" -ForegroundColor Red
    exit 1
}

# Install Chocolatey if not installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install PHP
Write-Host "Installing PHP..." -ForegroundColor Yellow
choco install php -y

# Install Composer
Write-Host "Installing Composer..." -ForegroundColor Yellow
choco install composer -y

# Install Node.js
Write-Host "Installing Node.js..." -ForegroundColor Yellow
choco install nodejs -y

# Install Git
Write-Host "Installing Git..." -ForegroundColor Yellow
choco install git -y

# Refresh environment variables
refreshenv

# Install recommended fonts
Write-Host "Installing JetBrains Mono font..." -ForegroundColor Yellow
$fontUrl = "https://github.com/JetBrains/JetBrainsMono/releases/latest/download/JetBrainsMono-2.304.zip"
$fontPath = "$env:TEMP\JetBrainsMono.zip"
$extractPath = "$env:TEMP\JetBrainsMono"

try {
    Invoke-WebRequest -Uri $fontUrl -OutFile $fontPath
    Expand-Archive -Path $fontPath -DestinationPath $extractPath -Force

    # Install fonts
    $fonts = Get-ChildItem -Path "$extractPath\fonts\ttf" -Filter "*.ttf"
    $fontFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)

    foreach ($font in $fonts) {
        Write-Host "Installing font: $($font.Name)" -ForegroundColor Cyan
        $fontFolder.CopyHere($font.FullName, 0x10)
    }

    # Cleanup
    Remove-Item $fontPath -Force
    Remove-Item $extractPath -Recurse -Force

    Write-Host "JetBrains Mono font installed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Failed to install JetBrains Mono font: $($_.Exception.Message)" -ForegroundColor Red
}

# Install VS Code extensions
Write-Host "Installing VS Code extensions..." -ForegroundColor Yellow

$extensions = @(
    "bmewburn.vscode-intelephense-client",
    "esbenp.prettier-vscode",
    "shufo.vscode-blade-formatter",
    "onecentlin.laravel-blade",
    "ryannaddy.laravel-artisan",
    "codingyu.laravel-goto-view",
    "bradlc.vscode-tailwindcss",
    "formulahendry.auto-rename-tag",
    "formulahendry.auto-close-tag",
    "christian-kohler.path-intellisense",
    "dbaeumer.vscode-eslint",
    "mikestead.dotenv",
    "zhuangtongfa.material-theme",
    "pkief.material-icon-theme",
    "xdebug.php-debug",
    "eamodio.gitlens",
    "usernamehw.errorlens",
    "alefragnani.bookmarks"
)

foreach ($extension in $extensions) {
    Write-Host "Installing extension: $extension" -ForegroundColor Cyan
    code --install-extension $extension
}

# Create sample Laravel project
Write-Host "Do you want to create a sample Laravel project? (y/n)" -ForegroundColor Yellow
$createProject = Read-Host

if ($createProject -eq "y" -or $createProject -eq "Y") {
    $projectName = Read-Host "Enter project name"
    Write-Host "Creating Laravel project: $projectName" -ForegroundColor Yellow

    composer create-project laravel/laravel $projectName

    Set-Location $projectName

    # Install additional packages for frontend
    Write-Host "Installing frontend dependencies..." -ForegroundColor Yellow
    npm install
    npm install -D @inertiajs/react @vitejs/plugin-react react react-dom @types/react @types/react-dom typescript
    npm install -D tailwindcss @tailwindcss/forms @tailwindcss/typography @tailwindcss/aspect-ratio autoprefixer postcss
    npm install -D daisyui
    npm install -D eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser
    npm install -D prettier

    # Initialize Tailwind
    npx tailwindcss init -p

    Write-Host "Laravel project created successfully!" -ForegroundColor Green
    Write-Host "Project location: $(Get-Location)" -ForegroundColor Cyan
}

Write-Host "=== Setup Complete! ===" -ForegroundColor Green
Write-Host "You can now:" -ForegroundColor Cyan
Write-Host "1. Open VS Code and load the workspace file" -ForegroundColor White
Write-Host "2. Copy example config files (remove .example from filename)" -ForegroundColor White
Write-Host "3. Start developing with Laravel!" -ForegroundColor White
Write-Host ""
Write-Host "Recommended next steps:" -ForegroundColor Yellow
Write-Host "1. Restart VS Code to load new extensions" -ForegroundColor White
Write-Host "2. Configure PHP path in VS Code if needed" -ForegroundColor White
Write-Host "3. Setup Xdebug for PHP debugging" -ForegroundColor White

Read-Host "Press Enter to exit"
