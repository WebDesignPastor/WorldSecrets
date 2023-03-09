import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modalCold", "modalWarm", "modalWarmer"]

  connect() {
    console.log('data')
    setTimeout(() => {
      this.modalColdTarget.classList.remove("d-none")
      this.modalColdTarget.classList.add("modal-seen")
    }, 5000);

    setTimeout(() => {
      this.modalColdTarget.classList.add("d-none")
      this.modalColdTarget.classList.remove("modal-seen")
    }, 15000);

    setTimeout(() => {
      this.modalWarmTarget.classList.remove("d-none")
      this.modalWarmTarget.classList.add("modal-seen")
    }, 25000);

    setTimeout(() => {
      this.modalWarmTarget.classList.add("d-none")
      this.modalWarmTarget.classList.remove("modal-seen")
    }, 35000);

    setTimeout(() => {
      this.modalWarmerTarget.classList.remove("d-none")
      this.modalWarmerTarget.classList.add("modal-seen")
    }, 45000);
  }
}
