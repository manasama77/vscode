# Laravel VS Code Global Setup Guide

## 🎯 Solusi untuk Tidak Perlu Setup Manual Setiap Project

### 1. **Global Setup (Install Sekali, Berlaku Selamanya)**

```powershell
# Jalankan di PowerShell Administrator
.\install-global.ps1
```

**Hasilnya:**

- ✅ Snippets Laravel tersedia di SEMUA project
- ✅ Settings Laravel otomatis terapply di project baru
- ✅ Extensions terinstall secara global
- ✅ Template generator tersedia

### 2. **Quick Project Generator (Untuk Project Baru)**

**Option A: Simple PowerShell Script**

```powershell
# Copy script ke project Laravel baru
.\generate-laravel-vscode.ps1
# atau
.\generate-laravel-vscode.ps1 "C:\path\to\project"
```

**Option B: VS Code Extension (Advanced)**

1. Install extension Laravel Workspace Generator (dari folder `laravel-extension/`)
2. Right-click pada folder project → "Generate Laravel Workspace Config"

**Option C: Command Line dari Mana Saja**

```bash
# Setelah global setup, tersedia di PATH
laravel-vscode-setup "C:\path\to\project"
```

### 3. **Template Repository Method**

Buat repository template di GitHub dengan konfigurasi ini:

```bash
# Clone template untuk project baru
git clone https://github.com/username/laravel-vscode-template.git my-project
cd my-project
composer install
npm install
```

### 4. **VS Code User Snippets (Global)**

Lokasi snippets global:

- Windows: `%APPDATA%\Code\User\snippets\`
- macOS: `~/Library/Application Support/Code/User/snippets/`
- Linux: `~/.config/Code/User/snippets/`

Copy snippets ke folder tersebut untuk tersedia di semua project.

### 5. **Workflow Optimal**

1. **Setup Global (Sekali doang)**:

   ```powershell
   .\install-global.ps1
   ```

2. **Untuk setiap project baru**:

   ```powershell
   # Buat Laravel project
   composer create-project laravel/laravel my-project
   cd my-project

   # Generate VS Code config
   .\generate-laravel-vscode.ps1

   # Buka di VS Code
   code .
   ```

3. **Start development**:
   - `Ctrl+Shift+S` → Laravel serve
   - `Ctrl+Shift+V` → Vite dev
   - Use snippets → `route`, `controller`, `model`, dll

## 🔧 Advanced: Custom VS Code Extension

### Install Extension Kustom

1. Copy folder `laravel-extension/` ke:

   ```
   %USERPROFILE%\.vscode\extensions\laravel-workspace-generator-1.0.0\
   ```

2. Restart VS Code

3. Extension akan muncul di Command Palette:
   - `Ctrl+Shift+P` → "Generate Laravel Workspace Config"

### Extension Features

- ✅ Generate .vscode structure otomatis
- ✅ Copy snippets dari user folder
- ✅ Keyboard shortcuts terintegrasi
- ✅ Task configuration untuk Laravel & Vite
- ✅ Debug configuration untuk PHP

## 📋 Files yang Dibuat Otomatis

### Per-Project Files (.vscode/)

- `settings.json` - Project-specific settings
- `tasks.json` - Laravel Artisan & Vite tasks
- `launch.json` - PHP debug configuration
- `keybindings.json` - Laravel shortcuts
- `snippets/` - Local snippets (optional)

### Global Files (User Profile)

- Snippets di `%APPDATA%\Code\User\snippets\`
- Settings di `%APPDATA%\Code\User\settings.json`
- Extensions list untuk auto-install

## 🚀 Usage Examples

### Quick Start Project Baru

```powershell
# Buat project Laravel baru dengan setup VS Code otomatis
composer create-project laravel/laravel blog
cd blog
..\generate-laravel-vscode.ps1
code .
```

### Update Existing Project

```powershell
# Jalankan di root project Laravel existing
.\generate-laravel-vscode.ps1 .
```

### Bulk Setup (Multiple Projects)

```powershell
# Setup multiple projects sekaligus
Get-ChildItem -Directory | ForEach-Object { .\generate-laravel-vscode.ps1 $_.FullName }
```

## ✨ Benefits

- ✅ **No Manual Setup** - Sekali install, berlaku selamanya
- ✅ **Consistent Config** - Sama di semua project
- ✅ **Quick Project Start** - 1 command untuk setup lengkap
- ✅ **Global Snippets** - Tersedia di semua project Laravel
- ✅ **Automated Tasks** - Laravel serve, Vite, migrations, dll
- ✅ **Debug Ready** - Xdebug configuration included
- ✅ **Multi-Stack Support** - Blade, React, TypeScript, TailwindCSS

Implementasi Langsung
