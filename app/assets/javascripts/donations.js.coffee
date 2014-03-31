# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Rails 4: how to use $(document).ready() with turbo-links
# http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links
ready = ->
  $("#donation_donable_type").change ->

    # make a GET call and replace the content with the
    # partial form view for donable
    donable_model_type = $("select#donation_donable_type :selected").val()
    donable_model_type = "Experience" unless donable_model_type
    jQuery.get "/users/donations/donable_selected/#{donable_model_type}", (data) ->
      $("#donable-model").html data

  # Initialize view with the current selection
  $("#donation_donable_type").trigger("change")

$(document).ready(ready)
$(document).on('page:load', ready)
