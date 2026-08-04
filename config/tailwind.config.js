// config/tailwind.config.js
module.exports = {
  content: [
    "./app/views/**/*.{html,erb,haml,slim}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/assets/stylesheets/**/*.css",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
