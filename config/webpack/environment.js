const { environment } = require('@rails/webpacker');
const babelLoader = require.resolve('babel-loader');

environment.loaders.append('babel', {
  test: /\.jsx?$/,
  use: {
    loader: babelLoader,
    options: {
      presets: ['@babel/preset-env']
    }
  }
});

module.exports = environment;
