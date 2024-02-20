const { environment } = require('@rails/webpacker');
const babelLoader = require('./loaders/babel');

environment.loaders.append('babel', babelLoader);
module.exports = environment;
