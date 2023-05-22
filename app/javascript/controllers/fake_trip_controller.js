import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modalCold", "modalWarm", "modalWarmer", "poi", "poiMarker", "progress"]
  currentIndex = 0
  clickCount = 0

  onClickEvent() {
    this.clickCount += 1
    if (this.clickCount === 2) {
      this.modalColdTargets[this.currentIndex].classList.remove("d-none")
      this.modalColdTargets[this.currentIndex].classList.add("modal-seen")
    } else if (this.clickCount === 4) {
      this.modalWarmTargets[this.currentIndex].classList.remove("d-none")
      this.modalWarmTargets[this.currentIndex].classList.add("modal-seen")
    } else if (this.clickCount === 6) {
      this.modalWarmerTargets[this.currentIndex].classList.remove("d-none")
      this.modalWarmerTargets[this.currentIndex].classList.add("modal-seen")
    } else if (this.clickCount != 7) {
      this.hideModal()
    }
  }

  hideModal() {
    this.modalColdTargets.forEach((modal) => {
      modal.classList.add("d-none")
    })
    this.modalWarmTargets.forEach((modal) => {
      modal.classList.add("d-none")
    })
  }

  showPoi() {
    this.modalWarmerTargets.forEach((modal) => {
      modal.classList.add("d-none")
    })
    this.poiTargets[this.currentIndex].classList.remove("d-none")
  }

  hidePoi() {
    this.poiTargets.forEach((poi) => {
      poi.classList.add("d-none")
    })
  }

  continueTrip() {
    this.hidePoi()
    this.currentIndex += 1
    this.clickCount = -1
    const currentProgress = parseInt(this.progressTarget.textContent)
    const newProgress = currentProgress + 1
    this.progressTarget.outerHTML = `<p class="step-front" data-modal-target="progress">${newProgress}</p>`
    this.poiMarkerTargets[this.currentIndex].classList.remove("poi-marker")
    this.poiMarkerTargets[this.currentIndex].classList.add("completed-poi")
    this.poiMarkerTargets[this.currentIndex + 1].classList.add('visible')
  }
}
