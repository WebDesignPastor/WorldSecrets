import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["button"]

  connect() {
  }

  active(){
    this.buttonTarget.classList.toggle("button-favorite-active")
  }
}
