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
    this.svglistTarget.classList.add("svg-colorized")
  }

  displayMap() {
    this.cardsForMapTarget.classList.remove('d-none')
    this.mapTarget.classList.remove("opacity-0")
    this.listTarget.classList.add("d-none")
    this.svgmapTarget.classList.add("svg-colorized")
  }
}
