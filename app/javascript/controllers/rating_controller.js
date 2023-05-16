import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  initialize() {
    this.emptysvgs = document.querySelectorAll(".emptystar-svg")
    this.fullsvgs = document.querySelectorAll(".star-svg")
  }

  connect() {
  }

  updateStars1() {
    this.emptysvgs[0].classList.add('d-none')
    this.emptysvgs[1].classList.remove('d-none')
    this.emptysvgs[2].classList.remove('d-none')
    this.emptysvgs[3].classList.remove('d-none')
    this.emptysvgs[4].classList.remove('d-none')
    this.fullsvgs[0].classList.remove('d-none')
    this.fullsvgs[1].classList.add('d-none')
    this.fullsvgs[2].classList.add('d-none')
    this.fullsvgs[3].classList.add('d-none')
    this.fullsvgs[4].classList.add('d-none')
  }

  updateStars2() {
    this.emptysvgs[0].classList.add('d-none')
    this.emptysvgs[1].classList.add('d-none')
    this.emptysvgs[2].classList.remove('d-none')
    this.emptysvgs[3].classList.remove('d-none')
    this.emptysvgs[4].classList.remove('d-none')
    this.fullsvgs[0].classList.remove('d-none')
    this.fullsvgs[1].classList.remove('d-none')
    this.fullsvgs[2].classList.add('d-none')
    this.fullsvgs[3].classList.add('d-none')
    this.fullsvgs[4].classList.add('d-none')
  }

  updateStars3() {
    this.emptysvgs[0].classList.add('d-none')
    this.emptysvgs[1].classList.add('d-none')
    this.emptysvgs[2].classList.add('d-none')
    this.emptysvgs[3].classList.remove('d-none')
    this.emptysvgs[4].classList.remove('d-none')
    this.fullsvgs[0].classList.remove('d-none')
    this.fullsvgs[1].classList.remove('d-none')
    this.fullsvgs[2].classList.remove('d-none')
    this.fullsvgs[3].classList.add('d-none')
    this.fullsvgs[4].classList.add('d-none')
  }

  updateStars4() {
    this.emptysvgs[0].classList.add('d-none')
    this.emptysvgs[1].classList.add('d-none')
    this.emptysvgs[2].classList.add('d-none')
    this.emptysvgs[3].classList.add('d-none')
    this.emptysvgs[4].classList.remove('d-none')
    this.fullsvgs[0].classList.remove('d-none')
    this.fullsvgs[1].classList.remove('d-none')
    this.fullsvgs[2].classList.remove('d-none')
    this.fullsvgs[3].classList.remove('d-none')
    this.fullsvgs[4].classList.add('d-none')
  }

  updateStars5() {
    this.emptysvgs[0].classList.add('d-none')
    this.emptysvgs[1].classList.add('d-none')
    this.emptysvgs[2].classList.add('d-none')
    this.emptysvgs[3].classList.add('d-none')
    this.emptysvgs[4].classList.add('d-none')
    this.fullsvgs[0].classList.remove('d-none')
    this.fullsvgs[1].classList.remove('d-none')
    this.fullsvgs[2].classList.remove('d-none')
    this.fullsvgs[3].classList.remove('d-none')
    this.fullsvgs[4].classList.remove('d-none')
  }
}
