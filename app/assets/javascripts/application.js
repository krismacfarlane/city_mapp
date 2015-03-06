// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  L.mapbox.accessToken = 'pk.eyJ1Ijoia3Jpc21hY2ZhcmxhbmUiLCJhIjoiN3lkS25jcyJ9.6chNwLDVAAfQacy0JKvNxQ';
  var map = L.mapbox.map('map', 'examples.map-i86nkdio')
      .setView([40.748817, -73.985428], 17);

  var featureGroup = L.featureGroup().addTo(map);

  var makeSidebar = function() {
    console.log("fired");
    $('#popup').removeClass('hidden');
  }

  var drawControl = new L.Control.Draw({
    edit: {
      featureGroup: featureGroup
    }
  }).addTo(map);

  map.on('draw:created', function(e) {
    var type = e.layerType,
     layer = e.layer;

    if (type === 'marker') {
      makeSidebar();
      var form = $("form#popup");
      form.on("submit", function(e){
        e.preventDefault();
        var popupContent = $("#popup-box").val();
        layer.bindPopup(popupContent);
        $('#popup').addClass('hidden');
      });
    }

   featureGroup.addLayer(layer);
   console.log(featureGroup.getBounds(layer));
  });

});
