import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  }

  connect() {

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: 'itinerary-map',
      zoom:1,
      style: "mapbox://styles/fanchpastor/cleztoc72003801o3sccvya6t"
    })
    
    this.#addMarkersToMap(this.markersValue)
    this.#fitMapToMarkers(this.markersValue)

    this.element.querySelector('canvas').style.height = '100vh'
    console.log(this.element.querySelector('canvas').style)

    this.map.resize();
  }

  #addMarkersToMap(markers) {
    markers.forEach((marker) => {
      let itineraryMarker = document.createElement('div');
      itineraryMarker.className = 'itinerary-marker';
      new mapboxgl.Marker(itineraryMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
    
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 5, duration: 0 })
    this.map.resize();
  }
}
