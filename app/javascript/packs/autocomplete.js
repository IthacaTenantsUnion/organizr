// http://easyautocomplete.com/guide

$(document).on('turbolinks:load', function() {

  var options = {
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

  $('*[data-behavior="autocomplete"]').easyAutocomplete(options);
});

