// eslint.config.js
import js from "@eslint/js";
import globals from "globals";
import pluginReact from "eslint-plugin-react";
import { defineConfig } from "eslint/config";

const { configs: reactConfigs } = pluginReact;

export default defineConfig([
  // 1) reines JS
  {
    files: ["**/*.{js,mjs,cjs}"],
    ignores: ["node_modules/**", "dist/**"],
    plugins: { js },
    extends: ["js/recommended"],
    languageOptions: {
      parserOptions: { ecmaVersion: "latest", sourceType: "module" },
      globals: globals.browser
    }
  },
  // 2) JSX/React
  {
    files: ["**/*.{jsx,js,mjs,cjs}"],
    plugins: { react: pluginReact },
    extends: [reactConfigs.flat.recommended],
    languageOptions: {
      parserOptions: { ecmaVersion: "latest", sourceType: "module" },
      globals: { ...globals.browser, ...globals.node }
    },
    settings: {
      react: { version: "detect" }
    }
  },
  // 3) Jest-Tests
  {
    files: [
      "**/*.test.{js,mjs,cjs}",
      "**/*.spec.{js,mjs,cjs}",
      "__tests__/**/*.{js,mjs,cjs}"
    ],
    languageOptions: {
      parserOptions: { ecmaVersion: "latest", sourceType: "module" },
      globals: globals.jest
    }
  }
]);
