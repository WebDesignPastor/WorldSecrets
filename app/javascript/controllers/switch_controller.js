import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {
  static targets = ["list", "map", "svglist", "svgmap", "cardsForMap"]

  connect() {
  }

  displayList() {
    this.cardsForMapTarget.classList.add('d-none')
    this.listTarget.classList.remove("d-none")
    this.mapTarget.classList.add("opacity-0")
    // this.tomImage.src = ''
    this.svgmapTarget.classList.remove("navbar-icon")
    this.svglistTarget.classList.add("navbar-icon")
  }

  displayMap() {
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
