const defaultTheme = require("tailwindcss/defaultTheme")

// For importing tailwind styles from protos gem
const execSync = require('child_process').execSync;
const output = execSync('bundle show protos', { encoding: 'utf-8' });
const protos_path = output.trim() + '/**/*.rb';

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.rb",
    "./lib/**/*.rb",
    protos_path
  ],
  theme: {
    fontFamily: {
      ...defaultTheme.fontFamily,
      sans: ["Inter Variable", ...defaultTheme.fontFamily.sans],
    },
    boxShadow: {
      sm: "var(--box-shadow-sm)",
      md: "var(--box-shadow-md)",
      lg: "var(--box-shadow-lg)"
    },
    extend: {
      spacing: {
        xs: "var(--spacing-xs)",
        sm: "var(--spacing-sm)",
        md: "var(--spacing-md)",
        lg: "var(--spacing-lg)",
        xl: "var(--spacing-xl)",
      },
      gap: {
        xs: "var(--spacing-gap-xs)",
        sm: "var(--spacing-gap-sm)",
        md: "var(--spacing-gap-md)",
        lg: "var(--spacing-gap-lg)",
        xl: "var(--spacing-gap-xl)",
      },
    },
  },
  plugins: [
    require("daisyui"),
    require("./frontend/tailwindcss/variable_font_plugin"),
  ],
}

