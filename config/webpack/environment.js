const { environment } = require('@rails/webpacker')
environment.loaders.delete('nodeModules');//英語のサイトのやつ

const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
     $: 'jquery/src/jquery',
     jQuery: 'jquery/src/jquery',
     jquery: 'jquery',
     'window.jQuery': 'jquery',
     Popper: ['popper.js', 'default']
   }))
module.exports = environment
