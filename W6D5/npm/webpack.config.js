module.exports = {
  entry: './entry.jsx',
  output: {
     filename: './congrats.jsx',
   },
   rules: [
     {
       test: [/\.jsx?$/],
       exclude: /(node_modules)/,
       use: {
         loader: 'babel-loader',
         query: {
           presets: ['@babel/env', '@babel/react']
         }
       },
     }
   ]
 },
 devtool: 'source-map',
 resolve: {
   extensions: ['.js', '.jsx', '*']
 }
};


// Create webpack.config.js and assign module.exports to the Webpack
//configuration object. Make sure to do the following:
//
// Set your entry and output files.
// Configure Babel transpilation of React and ES6 syntax
// Add a devtool
// Ensure that .js and .jsx files resolve automatically
// In the generated package.json:
//
// Add a webpack script for webpack to your package.json ("webpack": "webpack --mode=development --watch")
