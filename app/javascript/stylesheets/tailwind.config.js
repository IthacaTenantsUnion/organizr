module.exports = {
  purge: [],
  darkMode: true, // or 'media' or 'class'
  theme: {
    themeVariants: ['dark']
  },
  variants: {
    extend: {},
  },
  plugins: [require('tailwindcss-multi-theme')],
}