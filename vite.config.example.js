import react from '@vitejs/plugin-react';
import laravel from 'laravel-vite-plugin';
import path from 'path';
import { defineConfig } from 'vite';

export default defineConfig({
  plugins: [
    laravel({
      input: [
        'resources/css/app.css',
        'resources/js/app.js',
        // Untuk React/Inertia
        'resources/js/app.tsx',
      ],
      refresh: true,
    }),
    // Plugin React untuk Inertia.js
    react(),
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './resources/js'),
      '~': path.resolve(__dirname, './resources'),
    },
  },
  server: {
    host: '0.0.0.0',
    port: 5173,
    hmr: {
      host: 'localhost',
    },
  },
  build: {
    sourcemap: true,
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          inertia: ['@inertiajs/react'],
        },
      },
    },
  },
});
