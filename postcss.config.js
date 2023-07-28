module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss'),  // Add this line
    require('autoprefixer'), // Add this line, if not already present
    require('postcss-flexbugs-fixes')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
