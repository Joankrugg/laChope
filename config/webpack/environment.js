const { environment } = require('@rails/webpacker');
const babel = require('./loaders/babel');

environment.loaders.append('babel', babel);
module.exports = environment;
