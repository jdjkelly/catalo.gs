# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  layer = new L.StamenTileLayer "toner" 
  Better.map = new L.Map "map",
    zoomControl: false
    attributionControl: false
  Better.map.addLayer layer

  $(".icon-circle-arrow-up").hover ->
    $(this).toggleClass "icon-circle-arrow-up"
    $(this).toggleClass "icon-upload"

  $(".icon-circle-arrow-down").hover ->
    $(this).toggleClass "icon-circle-arrow-down"
    $(this).toggleClass "icon-download"
