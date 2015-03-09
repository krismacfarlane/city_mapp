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
  var map = $("#map");
  var mapId = map.attr("rid");
  var cityId;

  var spanToggle = function(e) {
    $(e.target).addClass("hidden");
    $("input.input-title").removeClass("hidden");
    var spanText = $(e.target).text();
    $("input.input-title").val(spanText);
  }

  var addTitle = function(e) {
    if (e.keyCode == 13) {
      $("input.input-title").addClass("hidden");
      $("span.map-title").removeClass("hidden");
      var textInput = $("input.input-title").val();
      debugger
      $("span.map-title").text(textInput);
    }
  }

  $("span.map-title").on("click", spanToggle);

  $("input.input-name").on("keypress", addTitle);

  L.mapbox.accessToken = 'pk.eyJ1Ijoia3Jpc21hY2ZhcmxhbmUiLCJhIjoiN3lkS25jcyJ9.6chNwLDVAAfQacy0JKvNxQ';
  var map = L.mapbox.map('map', 'examples.map-i86nkdio')
      .setView([40.748817, -73.985428], 13);

  $.ajax({
    type: "get",
    url: "/cities/1/maps/" + mapId + "/markers",
    dataType: "json"
  }).done(function(data) {
    for (var i = 0, len = data.length; i < len; i++){
      if(data[i].map_id == mapId) {
        L.mapbox.featureLayer({
          type: 'Feature',
          geometry: {
          type: 'Point',
          coordinates: [
            data[i].long,
            data[i].lat
          ]
        },
        properties: {
          description: data[i].popup_content,
          "marker-symbol": "star",
          "marker-size": "medium",
          "marker-color": "#B24FB8"
        }
        }).addTo(map);
      }
    } // end of for loop
  })



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
        // type.bindPopup(popupContent);
        $('#popup').addClass('hidden');
        // debugger

        var marker = featureGroup.getBounds(layer)._southWest;

        $.ajax({
          type: "post",
          url: "/cities/1/maps/" + mapId + "/markers",
          data: {
            lat:           marker.lat,
            long:          marker.lng,
            popup_content: popupContent
          }
        })
        .done(function(response) {
          console.log('ajax request APPROVED!');
          console.log(response);
        })
        .fail(function(jQxhr) {
          console.log('ajax request failed');
          console.log(jQxhr);
        });
      });
    };

   featureGroup.addLayer(layer);
   console.log(featureGroup.getBounds(layer));
  });

});
