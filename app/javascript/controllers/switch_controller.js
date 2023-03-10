import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {
  static targets = ["list", "map", "svglist", "svgmap"]

  connect() {
  }

  displayList() {
    this.listTarget.classList.remove("d-none")
    this.mapTarget.classList.add("d-none")
    this.svglistTarget.classList.add("svg-colorized")
  }

  displayMap() {
    this.mapTarget.classList.remove("d-none")
    this.listTarget.classList.add("d-none")
    this.svgmapTarget.classList.add("svg-colorized")
  }
}
