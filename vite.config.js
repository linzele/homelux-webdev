// vite.config.js
import { defineConfig } from 'vite';

export default defineConfig({
  root: '.', // Use the current directory as the root
  server: {
    open: false, // Disable automatic tab opening
    port: 3000, // Use your preferred port
    strictPort: true, // Prevent switching ports
  },
});
