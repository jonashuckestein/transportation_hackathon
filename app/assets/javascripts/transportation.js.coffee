$(document).on "page:change", ->
  FastClick.attach(document.body)

window.initMap = (data) ->
  console.log window.groups
  mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(52.505891, 13.393171)
  }
  


  map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);

  for group in window.groups

    for user in group.users
      latLng = new google.maps.LatLng(user.dest_lat, user.dest_long)
      image = {
        url: "/assets/profile/MapIcon/#{user.profile_image.replace("jpg", "png")}",
        #url: "/assets/profile/MapIcon/alec-hanefeld.png",
        size: new google.maps.Size(67, 78),
        origin: new google.maps.Point(0,0),
        anchor: new google.maps.Point(33,78)
      };
      marker = new google.maps.Marker({
        position: latLng,
        title: user.name,
        map: map,
        icon: image})
