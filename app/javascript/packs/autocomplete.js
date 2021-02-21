// http://easyautocomplete.com/guide

$(document).on('turbolinks:load', function() {

  var landlord_options = {
    url: function(phrase) {
      return "/landlords/search.json?q=" + phrase;
    },
    getValue: "name",
    list: {
      onClickEvent: function() {
        var selectedItemValue = $('#landlord_autocomplete').getSelectedItemData().landlord_id;
        $("#tenancy_landlord_id").val(selectedItemValue).trigger("change");
      },
      onKeyEnterEvent: function() {
        var selectedItemValue = $('#landlord_autocomplete').getSelectedItemData().landlord_id;
        $("#tenancy_landlord_id").val(selectedItemValue).trigger("change");
      },
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
    list: {
      onClickEvent: function() {
        var selectedItemValue = $('#unit_autocomplete').getSelectedItemData().unit_id;
        $("#tenancy_unit_id").val(selectedItemValue).trigger("change");
      },
      onKeyEnterEvent: function() {
        var selectedItemValue = $('#unit_autocomplete').getSelectedItemData().unit_id;
        $("#tenancy_unit_id").val(selectedItemValue).trigger("change");
      },
      match: {
        enabled: true
      }
    },
  };

  $('#landlord_autocomplete[data-behavior="autocomplete"]').easyAutocomplete(landlord_options);
  $('#unit_autocomplete[data-behavior="autocomplete"]').easyAutocomplete(unit_options);
});

