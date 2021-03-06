// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require autocomplete_zipcode
//= require_tree .


$(document).on('ready', () => {
  AutocompleteZipcode.mount({
    onSuccess: (containerEl, zipcodeEl) => {
      console.log(containerEl, zipcodeEl);
    },
    onFail: (containerEl, zipcodeEl) => {
      console.log(containerEl, zipcodeEl);
    },
  });

  document.addEventListener('zipcode.success', () => {
    console.log('zipcode fetched successfully');
  });

  document.addEventListener('zipcode.error', () => {
    console.log('zipcode fetch failed');
  });
});