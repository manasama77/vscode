# Laravel Development Workspace

Workspace VS Code yang dioptimalkan untuk development Laravel dengan berbagai stack teknologi modern.

## 🚀 Technology Stacks Supported

### 1. Laravel + Blade + TailwindCSS + Vite.js + DaisyUI/FlyonUI

- **Backend**: Laravel (PHP)
- **Frontend**: Blade Templates, TailwindCSS, DaisyUI/FlyonUI
- **Build Tool**: Vite.js
- **JavaScript**: jQuery/Vanilla JS

### 2. Laravel + Blade + Bootstrap 5 + Vite.js

- **Backend**: Laravel (PHP)
- **Frontend**: Blade Templates, Bootstrap 5
- **Build Tool**: Vite.js
- **JavaScript**: jQuery/Vanilla JS

### 3. Laravel + Inertia.js + React (TypeScript) + TailwindCSS + Vite.js

- **Backend**: Laravel API
- **Frontend**: React with TypeScript, Inertia.js
- **Styling**: TailwindCSS
- **Build Tool**: Vite.js

### 4. Laravel + Inertia.js + React (TypeScript) + TailwindCSS + ShadCN UI

- **Backend**: Laravel API
- **Frontend**: React with TypeScript, Inertia.js, ShadCN UI
- **Styling**: TailwindCSS
- **Build Tool**: Vite.js

## 🛠️ Setup Instructions

### Prerequisites

- PHP 8.1+
- Composer
- Node.js 18+
- NPM/Yarn

### Quick Start

1. Buka Command Palette (`Ctrl+Shift+P`)
2. Pilih "Tasks: Run Task"
3. Pilih task yang sesuai:
   - `Composer: Install` - Install PHP dependencies
   - `NPM: Install` - Install Node.js dependencies
   - `Laravel: Serve` - Start Laravel development server
   - `Vite: Dev Server` - Start Vite development server

### Keyboard Shortcuts

- `Ctrl+Shift+A` - Laravel Artisan Commands
- `Ctrl+Shift+S` - Quick Laravel Serve
- `Ctrl+Shift+V` - Quick Vite Dev Server
- `Ctrl+Shift+M` - Laravel Migrate
- `Ctrl+Shift+C` - Clear All Cache
- `Ctrl+Shift+G` - Go to View (Laravel)

## 📦 Extensions Installed

### PHP Development

- **PHP Intelephense** - PHP language server
- **PHP Debug** - Xdebug integration
- **Laravel Blade Snippets** - Blade template support
- **Laravel Artisan** - Artisan commands integration
- **Laravel goto view** - Quick view navigation

### Frontend Development

- **Prettier** - Code formatter
- **ESLint** - JavaScript linting
- **Tailwind CSS IntelliSense** - TailwindCSS support
- **Auto Rename Tag** - HTML tag management
- **Auto Close Tag** - Auto close HTML tags

### Utilities

- **Material Icon Theme** - File icons
- **One Dark Pro** - Color theme
- **Path Intellisense** - Path autocomplete
- **DotENV** - Environment file support

## 🎨 Theme & Fonts

### Color Theme

- **One Dark Pro Darker** - Professional dark theme optimized for long coding sessions

### Font Recommendations

Primary fonts (in order of preference):

1. **JetBrains Mono** - Excellent for coding with ligatures
2. **Fira Code** - Popular programming font with ligatures
3. **Cascadia Code** - Microsoft's programming font
4. **Source Code Pro** - Adobe's monospace font

### Font Installation

Download dan install salah satu font di atas, kemudian restart VS Code untuk mengaktifkan.

## 📝 Code Snippets

### PHP/Laravel Snippets

- `route` - Laravel route definition
- `controller` - Laravel controller class
- `model` - Laravel Eloquent model
- `migration` - Database migration
- `middleware` - Laravel middleware
- `request` - Form request validation
- `resource` - API resource class
- `factory` - Model factory
- `seeder` - Database seeder
- `job` - Queue job class
- `event` - Laravel event
- `listener` - Event listener

### Blade Template Snippets

- `layout` - Basic Blade layout
- `extend` - Extend Blade layout
- `section` - Blade section
- `include` - Include partial
- `component` - Blade component
- `if`, `ifelse`, `unless` - Conditional statements
- `foreach`, `for`, `forelse` - Loop statements
- `auth`, `guest` - Authentication checks
- `form` - Form with CSRF protection
- `error` - Error handling
- `vite` - Vite asset inclusion

### React/TypeScript Snippets

- `rfc` - React functional component
- `inertia` - Inertia.js page component
- `inertiaform` - Inertia form with useForm
- `useState`, `useEffect` - React hooks
- `customhook` - Custom React hook
- `interface`, `type`, `enum` - TypeScript definitions

### JavaScript/Frontend Snippets

- `container`, `grid`, `flex` - TailwindCSS layouts
- `card`, `btn` - TailwindCSS components
- `daisybtn`, `daisycard`, `daisymodal` - DaisyUI components
- `axiosget`, `axiospost` - Axios requests
- `fetch` - Fetch API
- `jqready`, `jqajax` - jQuery helpers

## ⚙️ Configuration Files

### VS Code Settings (`.vscode/settings.json`)

- Font configuration with ligatures
- PHP development settings
- JavaScript/TypeScript configuration
- TailwindCSS integration
- File associations and exclusions
- Formatting and linting rules

### Tasks (`.vscode/tasks.json`)

Pre-configured tasks untuk:

- Laravel Artisan commands (serve, migrate, cache, etc.)
- Composer operations (install, update)
- NPM operations (install, update, dev, build)
- Testing (PHPUnit, Laravel Test)

### Launch Configuration (`.vscode/launch.json`)

Debug configurations untuk:

- Xdebug PHP debugging
- Laravel Artisan debugging
- Browser debugging

### Keybindings (`.vscode/keybindings.json`)

Custom keyboard shortcuts untuk Laravel development workflow.

## 🔧 Customization

### Menambah Extension

```bash
# Via Command Palette
Ctrl+Shift+P -> Extensions: Install Extensions

# Atau install via command line
code --install-extension publisher.extension-name
```

### Mengubah Theme

```bash
# Command Palette
Ctrl+Shift+P -> Preferences: Color Theme
```

### Menambah Snippets

Edit file di `.vscode/snippets/` atau buat file baru dengan format:

```json
{
  "Snippet Name": {
    "prefix": "trigger",
    "body": ["line 1", "line 2"],
    "description": "Description"
  }
}
```

## 🎯 Workflow Recommendations

### Development Workflow

1. Start Laravel server: `Ctrl+Shift+S`
2. Start Vite dev server: `Ctrl+Shift+V`
3. Open browser to `http://localhost:8000`
4. Code dengan hot reload aktif

### Database Workflow

1. Create migration: Laravel Artisan -> `make:migration`
2. Edit migration file
3. Run migration: `Ctrl+Shift+M`
4. Create seeder jika diperlukan
5. Run fresh migration with seed untuk testing

### Testing Workflow

1. Write tests di `tests/` directory
2. Run tests: Command Palette -> Tasks: Run Task -> Laravel: Test
3. Debug tests dengan breakpoints menggunakan Xdebug

## 🐛 Debugging

### PHP Debugging (Xdebug)

1. Install dan konfigurasi Xdebug di PHP
2. Set breakpoints di VS Code
3. Start debugging: F5 atau Debug panel

### JavaScript Debugging

1. Use browser developer tools
2. Console.log untuk quick debugging
3. React DevTools untuk React development

## 📚 Additional Resources

### Laravel Documentation

- [Laravel Official Docs](https://laravel.com/docs)
- [Laravel Best Practices](https://github.com/alexeymezenin/laravel-best-practices)

### Frontend Resources

- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [DaisyUI Components](https://daisyui.com/components/)
- [React TypeScript Cheatsheet](https://react-typescript-cheatsheet.netlify.app/)
- [Inertia.js Documentation](https://inertiajs.com/)

### VS Code Resources

- [VS Code Tips and Tricks](https://code.visualstudio.com/docs/getstarted/tips-and-tricks)
- [VS Code Keyboard Shortcuts](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

## 🤝 Contributing

Untuk melaporkan issues atau request features:

1. Buka VS Code Command Palette
2. "File: Save Workspace As" untuk backup
3. Share konfigurasi atau suggestions

---

**Happy Coding! 🚀**

> Workspace ini dirancang untuk memaksimalkan produktivitas Laravel development dengan berbagai modern stack teknologi. Semua konfigurasi dapat dikustomisasi sesuai preferensi personal.
