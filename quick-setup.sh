#!/bin/bash
# Laravel VS Code Quick Setup
# Usage: ./quick-setup.sh [project-path]

PROJECT_PATH=${1:-.}
VSCODE_PATH="$PROJECT_PATH/.vscode"

echo "🚀 Laravel VS Code Quick Setup"
echo "Project path: $PROJECT_PATH"

# Create .vscode directory
mkdir -p "$VSCODE_PATH/snippets"

# Create settings.json
cat > "$VSCODE_PATH/settings.json" << 'EOF'
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
EOF

# Create tasks.json
cat > "$VSCODE_PATH/tasks.json" << 'EOF'
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
EOF

# Create launch.json
cat > "$VSCODE_PATH/launch.json" << 'EOF'
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
EOF

# Create keybindings.json
cat > "$VSCODE_PATH/keybindings.json" << 'EOF'
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
EOF

echo "✅ Laravel VS Code configuration created successfully!"
echo "📁 Location: $VSCODE_PATH"
echo "🔧 You can now open this project in VS Code and start developing!"
