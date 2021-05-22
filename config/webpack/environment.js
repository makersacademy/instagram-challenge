const { environment } = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.append(
  'Provide',
  new webpack.ProgressPlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'],
  })
);

module.exports = environment;
