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
    console.log("Hello from Map Controller")
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: 'itinerary-map',
      zoom:1,
      style: "mapbox://styles/fanchpastor/cleztoc72003801o3sccvya6t"
    })
    this.#addMarkersToMap(this.markersValue)
    this.#fitMapToMarkers(this.markersValue)
    this.element.querySelector('canvas').style.height = '100vh'
    this.map.resize()
  }

  activeMarkers(event) {
    // const firstCard = document.querySelector('.order-first')
    // if (document.querySelector('.order-first')) {
    //   document.querySelector('.order-first').classList.remove('order-first')
    // }
    // let cards = event.currentTarget.parentNode.parentNode.parentNode.parentNode.querySelector('.cards-fixed')
    // let currentTargetPos = event.currentTarget.dataset.lat
    // cards.querySelectorAll('.card').forEach((card) => {
    //   let targetCard = card.querySelector('.itinerary-infos').innerText
    //   if(targetCard.includes(currentTargetPos)) {
    //     card.classList.toggle('order-first')
    //   }
    // })
    const nameCards = document.querySelectorAll('#card-name-map')
    const markerName = event.currentTarget.getAttribute('data-name')
    this.itinerariesMarkerTargets.forEach((marker) => {
      if (marker.classList.contains('itinerary-marker-active')) {
        marker.classList.remove("itinerary-marker-active")
      }
    })
    event.currentTarget.classList.toggle('itinerary-marker-active')
    nameCards.forEach((card) => {
      if (card.innerText === markerName) {
        card.scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"})
      }
    })
  }

  #addMarkersToMap(markers) {
    markers.forEach((marker) => {
      let itineraryMarker = document.createElement('div')
      if (marker.completed === true) {
        itineraryMarker.className = 'itinerary-marker-completed'
      } else {
        itineraryMarker.className = 'itinerary-marker'
      }
      itineraryMarker.dataset.completed = marker.completed
      itineraryMarker.dataset.action ="click->itineraries#activeMarkers"
      itineraryMarker.dataset.name = marker.name
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
