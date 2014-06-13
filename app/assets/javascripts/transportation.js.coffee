_.extend window.HipDial,
  Views: {}
  Util: {}

# TODO implement global loading bar 

$(document).on "page:change", ->
  FastClick.attach(document.body)

