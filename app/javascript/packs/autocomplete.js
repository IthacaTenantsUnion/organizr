// http://easyautocomplete.com/guide

$(document).on('turbolinks:load', function() {

  var landlord_options = {
    url: function(phrase) {
      return "/landlords/search.json?q=" + phrase;
    },
    getValue: "name",
    requestDelay: 400,
    list: {
      match: {
        enabled: true
      }
    },
  };

  var unit_options = {
    url: function(address) {
      return "/units/search.json?q=" + address;
    },
    getValue: "address",
    requestDelay: 400,
    list: {
      match: {
        enabled: true
      }
    },
  };

  $('#landlord_autocomplete[data-behavior="autocomplete"]').easyAutocomplete(landlord_options);
  $('#unit_autocomplete[data-behavior="autocomplete"]').easyAutocomplete(unit_options);
});

