$(document).ready(function(){
var mapOptions = {
  center: new google.maps.LatLng(22.138289, -16.710054),
  zoom: 2

};
var handler = Gmaps.build('Google');
handler.buildMap({ provider: mapOptions, internal: {id: 'multi_markers'}}, function(){
  var markers = handler.addMarkers(destinationCoordinates);
  handler.bounds.extendWith(markers);
  // handler.fitMapToBounds();
});
});
