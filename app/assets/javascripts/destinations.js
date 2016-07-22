
var y = $(".destination_header").data("longitude");
var x = $(".destination_header").data("latitude");

var weatherURL = 'api.openweathermap.org/data/2.5/weather?lat={'+x+'}&lon={'+y+'}&key=b4fbb16c4a73a71494ce6441bd70d528'
;
var xhr = new XMLHttarpRequest(); // Instantiate our AJAX request object.
xhr.open('GET', weatherURL); // Set up our request: method and the URL or path

$.ajax(weatherURL).done(function(data){ // success is the callback function and equivalent to readystate=4
    $('#destinationTemp').attr('src', data.temp);

  )};
