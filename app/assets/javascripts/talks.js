// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on( 'ready page:load', function(event) {
  function pollForNotes() {
      if ($('div.notes').length > 0) {
          var afterId = $('div.notes div.note:first').data('id');
          $.ajax( {
              url:     $('form#new_note').attr('action'),
              data:    {after_id: afterId},
              success: function(data, status, xhr) {
                  if (data.match(/\S/)) {
                      $('div.notes').prepend(data);
                      $('div.notes').effect('highlight');
                  }
              },
              complete: function(xhr, status) {
                  setTimeout(pollForNotes, 5000);
              }
          } );
      }
  }

  pollForNotes();
} );
