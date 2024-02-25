import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["emptyStar", "star"]

  updateStars(event) {
    const clickedIndex = parseInt(event.target.getAttribute('data-rate'))

    this.starTargets.forEach((star, index) => {
      if (index < clickedIndex) {
        star.classList.remove('d-none')
        this.emptyStarTargets[index].classList.add('d-none')
      } else {
        this.emptyStarTargets[index].classList.remove('d-none')
        star.classList.add('d-none')
      }
    })
  }
}
