import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {
  static targets = ["list", "map", "svglist", "svgmap", "cardsForMap", "itinerariesMarker", "wrapperMap",
  "btnAucun", "btnNature", "btnUrbain", "btnMedieval", "btnPrehistorique",
  "Nature", "Urbain", "Médiéval", "Préhistorique", "short"]

  connect() {
  }

  displayList() {
    this.cardsForMapTarget.classList.add('d-none')
    this.listTarget.classList.remove("d-none")
    this.mapTarget.classList.add("opacity-0")
    this.svgmapTarget.classList.remove("navbar-icon")
    this.svglistTarget.classList.add("navbar-icon")
    this.wrapperMapTarget.classList.toggle("map-hidden")
  }

  displayMap() {
    this.itinerariesMarkerTargets.forEach((marker, index) => {
      marker.classList.add("animate-marker")
      marker.style.animationDelay = `${index * 200}ms`
    })
    this.wrapperMapTarget.classList.toggle("map-hidden")
    this.cardsForMapTarget.classList.remove('d-none')
    this.mapTarget.classList.remove("opacity-0")
    this.listTarget.classList.add("d-none")
    this.svgmapTarget.classList.add("navbar-icon")
    this.svglistTarget.classList.remove("navbar-icon")
  }

  filter(event) {
    const buttons = [this.btnAucunTarget, this.btnNatureTarget, this.btnUrbainTarget,
                     this.btnMedievalTarget, this.btnPrehistoriqueTarget]
    const categories = [this.NatureTargets, this.UrbainTargets, this.MédiévalTargets, this.PréhistoriqueTargets]
    const filterName = event.currentTarget.getAttribute("data-filter")
    if (filterName === "Aucun") {
      categories.forEach((categorie) => {
        categorie.forEach((card) => {
          card.classList.remove("d-none")
        })
      })
    } else {
      categories.forEach((categorie) => {
        categorie.forEach((card) => {
          if (card.getAttribute("data-filter") === filterName) {
            card.classList.remove("d-none")
          } else {
            card.classList.add("d-none")
          }
        })
      })
    }
    buttons.forEach((button) => {
      button.classList.remove("btn-primary")
      button.classList.add("btn-outline-primary")
    })
    event.currentTarget.classList.remove("btn-outline-primary")
    event.currentTarget.classList.add("btn-primary")
  }
}
