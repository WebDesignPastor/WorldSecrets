import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["firstModalCold", "firstModalWarm", "firstModalWarmer",
  "secondModalCold", "secondModalWarm", "secondModalWarmer",
  "firstPoi", "secondPoi", "poiMarker0", "poiMarker1", "poiMarker2"]

  connect() {
  }

  showFirstColdModal() {
    this.firstModalColdTarget.classList.remove("d-none")
    this.firstModalColdTarget.classList.add("modal-seen")
  }

  hideFirstColdModal() {
    this.firstModalColdTarget.classList.add("d-none")
  }

  showFirstWarmModal() {
    this.firstModalWarmTarget.classList.remove("d-none")
    this.firstModalWarmTarget.classList.add("modal-seen")
  }

  hideFirstWarmModal() {
    this.firstModalWarmTarget.classList.add("d-none")
  }

  showFirstWarmerModal() {
    this.firstModalWarmerTarget.classList.remove("d-none")
    this.firstModalWarmerTarget.classList.add("modal-seen")
  }

  showFirstPoi() {
    this.firstModalWarmerTarget.classList.add("d-none")
    this.firstPoiTarget.classList.remove("d-none")
  }

  continue() {
    this.poiMarker1Target.classList.remove("poi-marker")
    this.poiMarker1Target.classList.add("completed-poi")
    this.poiMarker2Target.classList.add('visible')
    this.firstPoiTarget.classList.add("d-none")
  }

  showSecondColdModal() {
    this.secondModalColdTarget.classList.remove("d-none")
    this.secondModalColdTarget.classList.add("modal-seen")
  }

  hideSecondColdModal() {
    this.secondModalColdTarget.classList.add("d-none")
  }

  showSecondWarmModal() {
    this.secondModalWarmTarget.classList.remove("d-none")
    this.secondModalWarmTarget.classList.add("modal-seen")
  }

  hideSecondWarmModal() {
    this.secondModalWarmTarget.classList.add("d-none")
  }

  showSecondWarmerModal() {
    this.secondModalWarmerTarget.classList.remove("d-none")
    this.secondModalWarmerTarget.classList.add("modal-seen")
  }

  showSecondPoi() {
    this.secondModalWarmerTarget.classList.add("d-none")
    this.secondPoiTarget.classList.remove("d-none")
  }

  onClickEvent() {
    if(this.count == undefined){
      this.count = 1
      this.showFirstColdModal()
    } else if(this.count == 1) {
      this.count += 1
      this.hideFirstColdModal()
    } else if(this.count == 2) {
      this.count += 1
      this.showFirstWarmModal()
    } else if(this.count == 3) {
      this.count += 1
      this.hideFirstWarmModal()
    } else if(this.count == 4) {
      this.count += 1
      this.showFirstWarmerModal()
    } else if(this.count == 5) {
      this.count +=1
      this.showFirstPoi()
    } else if(this.count == 6) {
      this.count += 1
      this.continue()
    } else if(this.count == 7) {
      this.count += 1
    } else if(this.count == 8) {
      this.count += 1
      this.showSecondColdModal()
    } else if(this.count == 9) {
      this.count += 1
      this.hideSecondColdModal()
    } else if(this.count == 10) {
      this.count += 1
      this.showSecondWarmModal()
    } else if(this.count == 11) {
      this.count += 1
      this.hideSecondWarmModal()
    } else if(this.count == 12) {
      this.count += 1
      this.showSecondWarmerModal()
    } else if(this.count == 13) {
      this.count +=1
      this.showSecondPoi()
    }
  }
}
