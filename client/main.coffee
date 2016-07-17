Meteor.startup ->
  GoogleMaps.load()

Template.body.onCreated ->
  # We can use the `ready` callback to interact with the map API once the map is ready.
  GoogleMaps.ready 'kitasMap', (map) ->
    # Add a marker to the map once it's ready
    marker = new google.maps.Marker
      position: map.options.center
      map: map.instance

Template.map.helpers
  mapOptions: ->
    # Make sure the maps API has loaded
    if GoogleMaps.loaded()
      center: new google.maps.LatLng(52.5200, 13.4050),
      zoom: 15