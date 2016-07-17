Meteor.startup ->
  GoogleMaps.load()

####### kistList template #######
Template.kitaList.helpers
  kitas: -> Kitas.find().fetch()
  active: -> 'active' if @_id is Session.get 'selectedKita'

Template.kitaList.events
  'click .kita': -> Session.set 'selectedKita', @_id
    
####### kistDetails template #######
Template.kitaDetails.helpers
  kita: -> Kitas.findOne Session.get 'selectedKita'

####### map template #######
Template.map.onCreated ->
  # We can use the `ready` callback to interact with the map API once the map is ready.
  GoogleMaps.ready 'kitasMap', (map) ->
    # Add a marker to the map once it's ready
    Kitas.find().forEach (kita) ->
      marker = new google.maps.Marker
        position: new google.maps.LatLng kita.lat, kita.lng
        map: map.instance
        animation:google.maps.Animation.DROP
        id: kita._id
      google.maps.event.addListener marker, 'click', (event) ->
        Session.set 'selectedKita', marker.id

Template.map.helpers
  mapOptions: ->
    # Make sure the maps API has loaded
    if GoogleMaps.loaded()
      center: new google.maps.LatLng(52.491982, 13.419418),
      zoom: 13