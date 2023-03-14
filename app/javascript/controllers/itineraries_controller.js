import { Controller } from "@hotwired/stimulus"
import { computeStyles } from "@popperjs/core"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  }

  static targets = ["itinerariesMarker"]

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

    this.map.resize();
  }

  activeMarkers(event) {

  if (document.querySelector('.order-first')) {
    document.querySelector('.order-first').classList.remove('order-first')
  }
    // Verifier si un a élément a la classe itineray-marker-active
    let cards = event.currentTarget.parentNode.parentNode.parentNode.parentNode.querySelector('.cards-fixed')
    let currentTargetPos = event.currentTarget.dataset.lat

    cards.querySelectorAll('.card').forEach((card) => {

      let targetCard = card.querySelector('.itinerary-infos').innerText
      if(targetCard.includes(currentTargetPos)) {
        card.classList.toggle('order-first')
      }
    })
    this.itinerariesMarkerTargets.forEach((marker) => {

      if (marker.classList.contains('itinerary-marker-active')) {
        marker.classList.remove("itinerary-marker-active")
      }
      else {
        console.log()
      }
    })
    event.currentTarget.classList.toggle('itinerary-marker-active')
  }

  #addMarkersToMap(markers) {

    markers.forEach((marker) => {
      let itineraryMarker = document.createElement('div');
      itineraryMarker.className = 'itinerary-marker';
      itineraryMarker.dataset.action ="click->itineraries#activeMarkers"
      itineraryMarker.dataset.itinerariesTarget = "itinerariesMarker"
      itineraryMarker.dataset.switchTarget = "itinerariesMarker"
      itineraryMarker.dataset.lat = marker.lat
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
