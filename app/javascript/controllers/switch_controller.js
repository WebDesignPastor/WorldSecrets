import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {
  static targets = ["list", "map", "svglist", "svgmap", "cardsForMap", "itinerariesMarker", "wrapperMap"]

  connect() {
  }

  displayList() {
    this.cardsForMapTarget.classList.add('d-none')
    this.listTarget.classList.remove("d-none")
    this.mapTarget.classList.add("opacity-0")
    // this.tomImage.src = ''
    this.svgmapTarget.classList.remove("navbar-icon")
    this.svglistTarget.classList.add("navbar-icon")
    this.wrapperMapTarget.classList.toggle("map-hidden")
  }

  displayMap() {
    // recuperer tous les markers en targets
    // itérer dessus for each
    this.itinerariesMarkerTargets.forEach((marker, index) => {
      // leur ajouter une classe animate-marker -> opacity 1
      marker.classList.add("animate-marker")
      marker.style.animationDelay = `${index * 200}ms`
    })

    this.wrapperMapTarget.classList.toggle("map-hidden")
    this.cardsForMapTarget.classList.remove('d-none')
    this.mapTarget.classList.remove("opacity-0")
    this.listTarget.classList.add("d-none")
    // this.svglistTarget.setAttribute('fill', 'red')
    this.svgmapTarget.classList.add("navbar-icon")
    this.svglistTarget.classList.remove("navbar-icon")

  }

  buttonActive() {

  }
}
