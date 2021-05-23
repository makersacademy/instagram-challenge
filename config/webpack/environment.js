const { environment } = require('@rails/webpacker');

const webpack = require('webpack');

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    jQuery: 'jquery',
  })
);

module.exports = environment;
