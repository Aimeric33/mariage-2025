const defaultTheme = require('tailwindcss/defaultTheme')
const execSync = require('child_process').execSync;
const activeAdminPath = execSync('bundle show activeadmin', { encoding: 'utf-8' }).trim();

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/assets/stylesheets/active_admin.css',
    './config/initializers/simple_form_tailwind.rb'
  ],
  darkMode: 'class',
  theme: {
    extend: {
      fontFamily: {
        sans: ['"Source\\ Sans\\ 3"', ...defaultTheme.fontFamily.sans],
        handwriting: ['Corinthia', ...defaultTheme.fontFamily.sans],
        handwritingBis: ['Birthstone', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: {
          400: '#de948b',
          500: '#cf7064',
          600: '#b85346',
          700: '#9b453a',
          800: '#813c33',
        },
        secondary: {
          200: '#bbd4cd',
          300: '#91b7ae',
          400: '#325A51',
          500: '#507c74',
          600: '#3e635d',
        },
        tertiary: {
          50: '#fff6ef',
          100: '#ffe8d5',
        },
      }
    },
  },
  plugins: [
    // require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require(`${activeAdminPath}/plugin.js`),
  ]
}
