# Laravel VS Code Global Setup Script
# Menambahkan snippets dan settings global ke VS Code User profile

Write-Host "=== Laravel VS Code Global Setup ===" -ForegroundColor Green
Write-Host "Script ini akan menambahkan snippets dan settings Laravel ke VS Code secara global" -ForegroundColor Yellow

# Get VS Code User folder
$vsCodeUserPath = "$env:APPDATA\Code\User"
$snippetsPath = "$vsCodeUserPath\snippets"

# Create snippets directory if not exists
if (!(Test-Path $snippetsPath)) {
    New-Item -Path $snippetsPath -ItemType Directory -Force
    Write-Host "Created snippets directory: $snippetsPath" -ForegroundColor Green
}

# Copy snippets to user folder
Write-Host "Installing global snippets..." -ForegroundColor Yellow

# PHP Snippets
$phpSnippetsSource = ".\.vscode\snippets\php.json"
$phpSnippetsTarget = "$snippetsPath\php.json"

if (Test-Path $phpSnippetsSource) {
    Copy-Item $phpSnippetsSource $phpSnippetsTarget -Force
    Write-Host "✅ PHP snippets installed globally" -ForegroundColor Green
}
else {
    Write-Host "❌ PHP snippets source not found" -ForegroundColor Red
}

# Blade Snippets
$bladeSnippetsSource = ".\.vscode\snippets\blade.json"
$bladeSnippetsTarget = "$snippetsPath\blade.json"

if (Test-Path $bladeSnippetsSource) {
    Copy-Item $bladeSnippetsSource $bladeSnippetsTarget -Force
    Write-Host "✅ Blade snippets installed globally" -ForegroundColor Green
}
else {
    Write-Host "❌ Blade snippets source not found" -ForegroundColor Red
}

# JavaScript Snippets
$jsSnippetsSource = ".\.vscode\snippets\javascript.json"
$jsSnippetsTarget = "$snippetsPath\javascript.json"

if (Test-Path $jsSnippetsSource) {
    Copy-Item $jsSnippetsSource $jsSnippetsTarget -Force
    Write-Host "✅ JavaScript snippets installed globally" -ForegroundColor Green
}
else {
    Write-Host "❌ JavaScript snippets source not found" -ForegroundColor Red
}

# TypeScript Snippets
$tsSnippetsSource = ".\.vscode\snippets\typescript.json"
$tsSnippetsTarget = "$snippetsPath\typescript.json"

if (Test-Path $tsSnippetsSource) {
    Copy-Item $tsSnippetsSource $tsSnippetsTarget -Force
    Write-Host "✅ TypeScript snippets installed globally" -ForegroundColor Green
}
else {
    Write-Host "❌ TypeScript snippets source not found" -ForegroundColor Red
}

# Update User Settings
Write-Host "Updating global VS Code settings..." -ForegroundColor Yellow

$userSettingsPath = "$vsCodeUserPath\settings.json"
$globalLaravelSettings = @'
{
    // ===== LARAVEL GLOBAL SETTINGS =====
    "files.associations": {
        "*.blade.php": "blade",
        "*.env.example": "dotenv",
        "*.env.local": "dotenv",
        "*.env.production": "dotenv",
        "*.env.staging": "dotenv",
        "*.env.testing": "dotenv",
        "artisan": "php"
    },

    "emmet.includeLanguages": {
        "blade": "html",
        "javascript": "javascriptreact",
        "typescript": "typescriptreact"
    },

    "tailwindCSS.includeLanguages": {
        "blade": "html",
        "javascript": "javascript",
        "typescript": "typescript"
    },

    "tailwindCSS.experimental.classRegex": [
        ["class:\\s*[\"']([^\"']*)[\"']", "[\"'](.*?)[\"']"],
        ["className:\\s*[\"']([^\"']*)[\"']", "[\"'](.*?)[\"']"],
        ["tw`([^`]*)`", "([^`]*)"],
        ["@apply\\s+([^;]*);", "([^;]*)"]
    ],

    // PHP/Laravel Settings
    "[php]": {
        "editor.tabSize": 4,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },

    "[blade]": {
        "editor.autoClosingBrackets": "always",
        "editor.autoClosingQuotes": "always",
        "editor.tabSize": 4,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },

    // Frontend Settings
    "[javascript]": {
        "editor.tabSize": 2,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },

    "[typescript]": {
        "editor.tabSize": 2,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },

    "[typescriptreact]": {
        "editor.tabSize": 2,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },

    // Exclude Laravel folders from search/watch
    "files.exclude": {
        "**/node_modules": true,
        "**/vendor": true,
        "**/.git": true,
        "**/bootstrap/cache": true,
        "**/storage/app": true,
        "**/storage/framework": true,
        "**/storage/logs": true,
        "**/.phpunit.result.cache": true
    },

    "files.watcherExclude": {
        "**/node_modules/**": true,
        "**/vendor/**": true,
        "**/storage/**": true,
        "**/bootstrap/cache/**": true
    },

    "search.exclude": {
        "**/node_modules": true,
        "**/vendor": true,
        "**/storage": true,
        "**/bootstrap/cache": true,
        "**/.git": true,
        "**/.phpunit.result.cache": true
    },

    // Intelephense Settings
    "intelephense.files.associations": [
        "*.php",
        "*.blade.php",
        "*.inc",
        "*.module",
        "*.install"
    ],

    "intelephense.files.exclude": [
        "**/node_modules/**",
        "**/vendor/**/Tests/**",
        "**/vendor/**/tests/**",
        "**/vendor/**/*Test.php",
        "**/vendor/**/*test.php",
        "**/storage/framework/**",
        "**/bootstrap/cache/**",
        "**/.phpunit.result.cache"
    ]
}
'@

# Backup existing settings if they exist
if (Test-Path $userSettingsPath) {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupPath = "$userSettingsPath.backup_$timestamp"
    Copy-Item $userSettingsPath $backupPath
    Write-Host "✅ Backed up existing settings to: $backupPath" -ForegroundColor Cyan
}

# Read existing settings or create new
$existingSettings = @{}
if (Test-Path $userSettingsPath) {
    try {
        $existingContent = Get-Content $userSettingsPath -Raw
        $existingSettings = $existingContent | ConvertFrom-Json
    }
    catch {
        Write-Host "⚠️ Could not parse existing settings, creating new file" -ForegroundColor Yellow
    }
}

# Merge settings
$newSettings = $globalLaravelSettings | ConvertFrom-Json
$mergedSettings = @{}

# Copy existing settings
if ($existingSettings.PSObject.Properties) {
    foreach ($property in $existingSettings.PSObject.Properties) {
        $mergedSettings[$property.Name] = $property.Value
    }
}

# Add/Update Laravel settings
foreach ($property in $newSettings.PSObject.Properties) {
    $mergedSettings[$property.Name] = $property.Value
    Write-Host "✅ Added/Updated setting: $($property.Name)" -ForegroundColor Green
}

# Write merged settings back
$mergedSettings | ConvertTo-Json -Depth 10 | Out-File $userSettingsPath -Encoding UTF8
Write-Host "✅ Updated global VS Code settings" -ForegroundColor Green

# Create Laravel project template generator function
Write-Host "Creating Laravel project template generator..." -ForegroundColor Yellow

$templateGeneratorPath = "$vsCodeUserPath\laravel-template-generator.ps1"
$templateScript = @'
# Laravel Project Template Generator
param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath
)

Write-Host "Creating Laravel project structure at: $ProjectPath" -ForegroundColor Green

$vscodePath = "$ProjectPath\.vscode"

# Create .vscode directory
New-Item -Path $vscodePath -ItemType Directory -Force | Out-Null

# Tasks.json
$tasksContent = @'
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Laravel: Serve",
            "type": "shell",
            "command": "php",
            "args": ["artisan", "serve"],
            "group": "build",
            "isBackground": true,
            "problemMatcher": []
        },
        {
            "label": "Vite: Dev Server",
            "type": "shell",
            "command": "npm",
            "args": ["run", "dev"],
            "group": "build",
            "isBackground": true,
            "problemMatcher": []
        },
        {
            "label": "Laravel: Migrate",
            "type": "shell",
            "command": "php",
            "args": ["artisan", "migrate"],
            "group": "build"
        }
    ]
}
'@

$tasksContent | Out-File "$vscodePath\tasks.json" -Encoding UTF8

# Launch.json
$launchContent = @'
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003
        }
    ]
}
'@

$launchContent | Out-File "$vscodePath\launch.json" -Encoding UTF8

Write-Host "✅ Laravel project template created successfully!" -ForegroundColor Green
Write-Host "Location: $ProjectPath\.vscode" -ForegroundColor Cyan
'@

$templateScript | Out-File $templateGeneratorPath -Encoding UTF8
Write-Host "✅ Created Laravel project template generator" -ForegroundColor Green
Write-Host "Usage: powershell $templateGeneratorPath -ProjectPath 'C:\path\to\project'" -ForegroundColor Cyan

Write-Host "`n=== SETUP COMPLETED! ===" -ForegroundColor Green
Write-Host "Snippets dan settings telah diinstall secara global." -ForegroundColor Yellow
Write-Host "`nUntuk project baru, Anda bisa:" -ForegroundColor Cyan
Write-Host "1. Gunakan snippets yang sudah tersedia di semua project" -ForegroundColor White
Write-Host "2. Jalankan template generator untuk structure .vscode:" -ForegroundColor White
Write-Host "   powershell `"$templateGeneratorPath`" -ProjectPath `"C:\path\to\your\project`"" -ForegroundColor Gray
Write-Host "`nRestart VS Code untuk menerapkan perubahan!" -ForegroundColor Yellow

Read-Host "`nPress Enter to continue"
