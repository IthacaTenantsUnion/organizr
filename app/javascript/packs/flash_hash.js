$(document).on('turbolinks:load', function() { 
  $('.flash a.close').on('click', function(e) {
    $(e.target).closest('.flash').fadeOut(500, function() { $(this).remove(); });
  });
});