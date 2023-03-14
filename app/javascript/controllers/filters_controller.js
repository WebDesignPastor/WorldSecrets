import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filters"
export default class extends Controller {
  static targets = ["btn_aucune", "btn_nature", "btn_urbain", "btn_medieval","btn_prehis"]
  connect() {
  }

  // buttonAucunActive(event){
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.classList.add('btn-primary')
  // }

  // buttonNatureActive(event){
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.classList.add('btn-primary')
  // }

  // buttonUrbainActive(event){
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.classList.add('btn-primary')
  // }

  // buttonMedievalActive(event){
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.classList.add('btn-primary')
  // }

  // buttonPrehistoriqueActive(event){
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.classList.add('btn-primary')
  // }
}
