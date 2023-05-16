import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['star', 'emptyStar']

  connect() {
    console.log(this.emptyStarTargets)
    // console.log(this.starTargets)
  }

  updateStars(event) {
    const rating = parseInt(event.target.dataset.rating)

    this.emptyStarTargets.forEach((star, index) => {
      if (index < rating) {
        star.classList.add('d-none');
        this.starTargets[index].classList.remove('d-none');
      } else {
        star.classList.remove('d-none');
        this.starTargets[index].classList.add('d-none');
      }
    })
  }
}
