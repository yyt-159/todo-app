// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import Rails from '@rails/ujs';
Rails.start();

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


import 'jquery/dist/jquery.js'
import 'popper.js/dist/popper.js'
import 'bootstrap/dist/js/bootstrap'






import "/applications.scss";

//消すとき確認するやつ
window.onload = () => {

  class Confirm {
    constructor(el) {
      this.message = el.getAttribute('data-confirm')
      if (this.message) {
        el.form.addEventListener('submit', this.confirm.bind(this))
      } else {
        console && console.warn('No value specified in `data-confirm`', el)
      }
    }

    confirm(e) {
      if (!window.confirm(this.message)) {
        e.preventDefault();
      }
    }
  }

  Array.from(document.querySelectorAll('[data-confirm]')).forEach((el) => {
    new Confirm(el)
  })

}