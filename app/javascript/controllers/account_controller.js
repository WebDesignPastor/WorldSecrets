import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account"
export default class extends Controller {
  static targets = [
    "deleteButton", "itinerariesList", "backButton", "itinerariesCategory", "gear", "cross",
    "logoutButton", "privacyButton"
  ]

  appearOptions() {
    this.logoutButtonTarget.classList.remove("d-none")
    this.deleteButtonTarget.classList.remove("d-none")
    this.privacyButtonTarget.classList.remove("d-none")
    this.backButtonTarget.classList.add("d-none")
    this.itinerariesListTargets.forEach((list) => {
      list.classList.add("d-none")
    })
    this.itinerariesCategoryTargets.forEach((category) => {
      category.classList.add("d-none")
    })
    this.gearTarget.classList.add("d-none")
    this.crossTarget.classList.remove("d-none")
  }

  disappearOptions() {
    this.logoutButtonTarget.classList.add("d-none")
    this.deleteButtonTarget.classList.add("d-none")
    this.privacyButtonTarget.classList.add("d-none")
    this.backButtonTarget.classList.remove("d-none")
    this.itinerariesListTargets.forEach((list) => {
      list.classList.remove("d-none")
    })
    this.itinerariesCategoryTargets.forEach((category) => {
      category.classList.remove("d-none")
    })
    this.gearTarget.classList.remove("d-none")
    this.crossTarget.classList.add("d-none")
  }
}
