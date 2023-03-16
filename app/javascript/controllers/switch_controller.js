import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {
  static targets = ["list", "map", "svglist", "svgmap", "cardsForMap", "itinerariesMarker", "wrapperMap",
  "btnAucun", "btnNature", "btnUrbain", "btnMedieval", "btnPrehistorique",
  "Nature", "Urbain", "Médiéval", "Préhistorique"]

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

  noFilter() {
    this.NatureTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.UrbainTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.MédiévalTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.PréhistoriqueTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.btnAucunTarget.classList.remove("btn-outline-primary")
    this.btnAucunTarget.classList.add("btn-primary")
    this.btnNatureTarget.classList.remove("btn-primary")
    this.btnNatureTarget.classList.add("btn-outline-primary")
    this.btnUrbainTarget.classList.remove("btn-primary")
    this.btnUrbainTarget.classList.add("btn-outline-primary")
    this.btnMedievalTarget.classList.remove("btn-primary")
    this.btnMedievalTarget.classList.add("btn-outline-primary")
    this.btnPrehistoriqueTarget.classList.remove("btn-primary")
    this.btnPrehistoriqueTarget.classList.add("btn-outline-primary")
  }

  natureFilter() {
    this.NatureTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.UrbainTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.MédiévalTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.PréhistoriqueTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.btnAucunTarget.classList.remove("btn-primary")
    this.btnAucunTarget.classList.add("btn-outline-primary")
    this.btnNatureTarget.classList.remove("btn-outline-primary")
    this.btnNatureTarget.classList.add("btn-primary")
    this.btnUrbainTarget.classList.remove("btn-primary")
    this.btnUrbainTarget.classList.add("btn-outline-primary")
    this.btnMedievalTarget.classList.remove("btn-primary")
    this.btnMedievalTarget.classList.add("btn-outline-primary")
    this.btnPrehistoriqueTarget.classList.remove("btn-primary")
    this.btnPrehistoriqueTarget.classList.add("btn-outline-primary")
  }

  urbainFilter() {
    this.NatureTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.UrbainTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.MédiévalTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.PréhistoriqueTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.btnAucunTarget.classList.remove("btn-primary")
    this.btnAucunTarget.classList.add("btn-outline-primary")
    this.btnNatureTarget.classList.remove("btn-primary")
    this.btnNatureTarget.classList.add("btn-outline-primary")
    this.btnUrbainTarget.classList.remove("btn-outline-primary")
    this.btnUrbainTarget.classList.add("btn-primary")
    this.btnMedievalTarget.classList.remove("btn-primary")
    this.btnMedievalTarget.classList.add("btn-outline-primary")
    this.btnPrehistoriqueTarget.classList.remove("btn-primary")
    this.btnPrehistoriqueTarget.classList.add("btn-outline-primary")
  }

  medievalFilter() {
    this.NatureTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.UrbainTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.MédiévalTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.PréhistoriqueTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.btnAucunTarget.classList.remove("btn-primary")
    this.btnAucunTarget.classList.add("btn-outline-primary")
    this.btnNatureTarget.classList.remove("btn-primary")
    this.btnNatureTarget.classList.add("btn-outline-primary")
    this.btnUrbainTarget.classList.remove("btn-primary")
    this.btnUrbainTarget.classList.add("btn-outline-primary")
    this.btnMedievalTarget.classList.remove("btn-outline-primary")
    this.btnMedievalTarget.classList.add("btn-primary")
    this.btnPrehistoriqueTarget.classList.remove("btn-primary")
    this.btnPrehistoriqueTarget.classList.add("btn-outline-primary")
  }

  prehistoriqueFilter() {
    this.NatureTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.UrbainTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.MédiévalTargets.forEach((target) => {
      target.classList.add("d-none")
    })
    this.PréhistoriqueTargets.forEach((target) => {
      target.classList.remove("d-none")
    })
    this.btnAucunTarget.classList.remove("btn-primary")
    this.btnAucunTarget.classList.add("btn-outline-primary")
    this.btnNatureTarget.classList.remove("btn-primary")
    this.btnNatureTarget.classList.add("btn-outline-primary")
    this.btnUrbainTarget.classList.remove("btn-primary")
    this.btnUrbainTarget.classList.add("btn-outline-primary")
    this.btnMedievalTarget.classList.remove("btn-primary")
    this.btnMedievalTarget.classList.add("btn-outline-primary")
    this.btnPrehistoriqueTarget.classList.remove("btn-outline-primary")
    this.btnPrehistoriqueTarget.classList.add("btn-primary")
  }
}
