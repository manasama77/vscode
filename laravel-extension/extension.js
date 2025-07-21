const vscode = require('vscode');
const fs = require('fs');
const path = require('path');

function activate(context) {
  console.log('Laravel Workspace Generator is now active!');

  let disposable = vscode.commands.registerCommand(
    'laravel-workspace.generateConfig',
    async function (uri) {
      const workspaceFolder = uri
        ? uri.fsPath
        : vscode.workspace.workspaceFolders?.[0]?.uri.fsPath;

      if (!workspaceFolder) {
        vscode.window.showErrorMessage('No workspace folder found');
        return;
      }

      try {
        await generateLaravelWorkspace(workspaceFolder);
        vscode.window.showInformationMessage(
          'Laravel workspace configuration generated successfully!'
        );
      } catch (error) {
        vscode.window.showErrorMessage(
          `Failed to generate workspace: ${error.message}`
        );
      }
    }
  );

  context.subscriptions.push(disposable);
}

async function generateLaravelWorkspace(workspaceFolder) {
  const vscodeFolder = path.join(workspaceFolder, '.vscode');

  // Create .vscode directory
  if (!fs.existsSync(vscodeFolder)) {
    fs.mkdirSync(vscodeFolder, { recursive: true });
  }

  // Generate settings.json
  const settings = {
    'files.associations': {
      '*.blade.php': 'blade',
      '*.env.example': 'dotenv',
      artisan: 'php',
    },
    'emmet.includeLanguages': {
      blade: 'html',
    },
    '[php]': {
      'editor.tabSize': 4,
      'editor.insertSpaces': true,
      'editor.formatOnSave': true,
    },
    '[blade]': {
      'editor.tabSize': 4,
      'editor.insertSpaces': true,
      'editor.formatOnSave': true,
    },
    '[javascript]': {
      'editor.tabSize': 2,
      'editor.insertSpaces': true,
      'editor.formatOnSave': true,
    },
    '[typescript]': {
      'editor.tabSize': 2,
      'editor.insertSpaces': true,
      'editor.formatOnSave': true,
    },
  };

  // Generate tasks.json
  const tasks = {
    version: '2.0.0',
    tasks: [
      {
        label: 'Laravel: Serve',
        type: 'shell',
        command: 'php',
        args: ['artisan', 'serve'],
        group: 'build',
        isBackground: true,
        problemMatcher: [],
      },
      {
        label: 'Laravel: Serve (Port 8080)',
        type: 'shell',
        command: 'php',
        args: ['artisan', 'serve', '--port=8080'],
        group: 'build',
        isBackground: true,
        problemMatcher: [],
      },
      {
        label: 'Vite: Dev Server',
        type: 'shell',
        command: 'npm',
        args: ['run', 'dev'],
        group: 'build',
        isBackground: true,
        problemMatcher: [],
      },
      {
        label: 'Laravel: Migrate',
        type: 'shell',
        command: 'php',
        args: ['artisan', 'migrate'],
        group: 'build',
        problemMatcher: [],
      },
      {
        label: 'Laravel: Clear Cache',
        type: 'shell',
        command: 'php',
        args: ['artisan', 'cache:clear'],
        group: 'build',
        problemMatcher: [],
      },
      {
        label: 'Composer: Install',
        type: 'shell',
        command: 'composer',
        args: ['install'],
        group: 'build',
        problemMatcher: [],
      },
      {
        label: 'NPM: Install',
        type: 'shell',
        command: 'npm',
        args: ['install'],
        group: 'build',
        problemMatcher: [],
      },
    ],
  };

  // Generate launch.json
  const launch = {
    version: '0.2.0',
    configurations: [
      {
        name: 'Listen for Xdebug',
        type: 'php',
        request: 'launch',
        port: 9003,
        stopOnEntry: false,
        pathMappings: {
          '/var/www/html': '${workspaceFolder}',
        },
      },
      {
        name: 'Laravel Artisan',
        type: 'php',
        request: 'launch',
        program: '${workspaceFolder}/artisan',
        args: [],
        cwd: '${workspaceFolder}',
        console: 'integratedTerminal',
      },
    ],
  };

  // Generate keybindings.json
  const keybindings = [
    {
      key: 'ctrl+shift+s',
      command: 'workbench.action.tasks.runTask',
      args: 'Laravel: Serve',
    },
    {
      key: 'ctrl+shift+v',
      command: 'workbench.action.tasks.runTask',
      args: 'Vite: Dev Server',
    },
    {
      key: 'ctrl+shift+m',
      command: 'workbench.action.tasks.runTask',
      args: 'Laravel: Migrate',
    },
    {
      key: 'ctrl+shift+c',
      command: 'workbench.action.tasks.runTask',
      args: 'Laravel: Clear Cache',
    },
  ];

  // Write files
  fs.writeFileSync(
    path.join(vscodeFolder, 'settings.json'),
    JSON.stringify(settings, null, 4)
  );
  fs.writeFileSync(
    path.join(vscodeFolder, 'tasks.json'),
    JSON.stringify(tasks, null, 4)
  );
  fs.writeFileSync(
    path.join(vscodeFolder, 'launch.json'),
    JSON.stringify(launch, null, 4)
  );
  fs.writeFileSync(
    path.join(vscodeFolder, 'keybindings.json'),
    JSON.stringify(keybindings, null, 4)
  );

  // Create snippets folder
  const snippetsFolder = path.join(vscodeFolder, 'snippets');
  if (!fs.existsSync(snippetsFolder)) {
    fs.mkdirSync(snippetsFolder, { recursive: true });
  }

  // Copy snippets from user folder if available
  const userSnippetsPath = path.join(
    require('os').homedir(),
    'AppData',
    'Roaming',
    'Code',
    'User',
    'snippets'
  );

  const snippetFiles = [
    'php.json',
    'blade.json',
    'javascript.json',
    'typescript.json',
  ];

  for (const file of snippetFiles) {
    const sourcePath = path.join(userSnippetsPath, file);
    const targetPath = path.join(snippetsFolder, file);

    if (fs.existsSync(sourcePath)) {
      fs.copyFileSync(sourcePath, targetPath);
    }
  }
}

function deactivate() {}

module.exports = {
  activate,
  deactivate,
};
