# Laravel Project Quick Generator
# Usage: .\generate-laravel-vscode.ps1 [ProjectPath]

param(
    [string]$ProjectPath = "."
)

Write-Host "🚀 Laravel VS Code Quick Generator" -ForegroundColor Green
Write-Host "Project path: $ProjectPath" -ForegroundColor Yellow

$vscodePath = Join-Path $ProjectPath ".vscode"

# Create .vscode directory
if (!(Test-Path $vscodePath)) {
    New-Item -Path $vscodePath -ItemType Directory -Force | Out-Null
    Write-Host "✅ Created .vscode directory" -ForegroundColor Green
}

# Create snippets directory
$snippetsPath = Join-Path $vscodePath "snippets"
if (!(Test-Path $snippetsPath)) {
    New-Item -Path $snippetsPath -ItemType Directory -Force | Out-Null
}

# Generate settings.json
$settings = @'
{
    "files.associations": {
        "*.blade.php": "blade",
        "*.env.example": "dotenv",
        "artisan": "php"
    },
    "emmet.includeLanguages": {
        "blade": "html"
    },
    "[php]": {
        "editor.tabSize": 4,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },
    "[blade]": {
        "editor.tabSize": 4,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },
    "[javascript]": {
        "editor.tabSize": 2,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    },
    "[typescript]": {
        "editor.tabSize": 2,
        "editor.insertSpaces": true,
        "editor.formatOnSave": true
    }
}
'@

$settings | Out-File (Join-Path $vscodePath "settings.json") -Encoding UTF8
Write-Host "✅ Created settings.json" -ForegroundColor Green

# Generate tasks.json
$tasks = @'
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
            "label": "Laravel: Serve (Port 8080)",
            "type": "shell",
            "command": "php",
            "args": ["artisan", "serve", "--port=8080"],
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
            "group": "build",
            "problemMatcher": []
        },
        {
            "label": "Laravel: Clear Cache",
            "type": "shell",
            "command": "php",
            "args": ["artisan", "cache:clear"],
            "group": "build",
            "problemMatcher": []
        }
    ]
}
'@

$tasks | Out-File (Join-Path $vscodePath "tasks.json") -Encoding UTF8
Write-Host "✅ Created tasks.json" -ForegroundColor Green

# Generate launch.json
$launch = @'
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

$launch | Out-File (Join-Path $vscodePath "launch.json") -Encoding UTF8
Write-Host "✅ Created launch.json" -ForegroundColor Green

# Generate keybindings.json
$keybindings = @'
[
    {
        "key": "ctrl+shift+s",
        "command": "workbench.action.tasks.runTask",
        "args": "Laravel: Serve"
    },
    {
        "key": "ctrl+shift+v",
        "command": "workbench.action.tasks.runTask",
        "args": "Vite: Dev Server"
    },
    {
        "key": "ctrl+shift+m",
        "command": "workbench.action.tasks.runTask",
        "args": "Laravel: Migrate"
    }
]
'@

$keybindings | Out-File (Join-Path $vscodePath "keybindings.json") -Encoding UTF8
Write-Host "✅ Created keybindings.json" -ForegroundColor Green

Write-Host "`n🎉 Laravel VS Code configuration generated successfully!" -ForegroundColor Green
Write-Host "📁 Location: $vscodePath" -ForegroundColor Cyan
Write-Host "`n🚀 Next steps:" -ForegroundColor Yellow
Write-Host "1. Open project in VS Code" -ForegroundColor White
Write-Host "2. Press Ctrl+Shift+S to start Laravel server" -ForegroundColor White
Write-Host "3. Press Ctrl+Shift+V to start Vite dev server" -ForegroundColor White
Write-Host "4. Start coding with snippets! (try typing 'route', 'controller', etc.)" -ForegroundColor White
