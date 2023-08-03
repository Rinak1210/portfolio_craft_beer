import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", function() {

  // For Bootstrap tooltips and popovers
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();

  // For handling Bootstrap navbar toggler
  $('.navbar-toggler').on('click', function () {
    $('.navbar-collapse').toggleClass('show');
  });
});

