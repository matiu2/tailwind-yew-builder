module.exports = {
  purge: [
    // source_code represents the rust (yew?) source code root
    "source_code/src/**/*.rs", "source_code/index.html"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}

