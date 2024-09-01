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
    `${activeAdminPath}/plugin.js`,
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require(`${activeAdminPath}/plugin.js`),
  ]
}
