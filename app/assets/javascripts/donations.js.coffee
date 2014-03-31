# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Rails 4: how to use $(document).ready() with turbo-links
# http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links
ready = ->
  $("#donation_donable_type").change ->

    # make a GET call and replace the content with the
    # partial form view for donable
    donable_model_type = if @value then @value else "Experience"
    user_id = if $("#donation_user_id").val() then "/#{$('#donation_user_id').val()}" else ""
    donation_id = if $("#donation_id").val() then "/#{$('#donation_id').val()}" else ""
    jQuery.get "/users#{user_id}/donations#{donation_id}/donable_selected/#{donable_model_type}", (data) ->
      $("#donable-model").html data

  # Initialize view with the current selection
  $("#donation_donable_type").trigger("change")

$(document).ready(ready)
$(document).on('page:load', ready)
