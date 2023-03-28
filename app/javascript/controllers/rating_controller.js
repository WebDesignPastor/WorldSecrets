import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {
  static targets = ['emptyStar', 'star']
  connect() {
  }

  addRate(event) {
    const rating = event.target.closest("button").dataset.rating
    const rate = this.starTargets.indexOf(event.target) + 1
    const tripId = this.data.get('tripId')
    fetch(`/trips/${tripId}/add_rate?rate=${rate}`)
      .then(response => response.json())
      .then(data => {
        // Do something with the response data, like update the UI
      })
    // const questionId = this.element.dataset.questionId;
    // Rails.ajax({
    //   url: `/questions/${questionId}/add_rating`,
    //   type: "POST",
    //   data: `rating=${rating}`,
    // })
    this.updateStars(rating)
  }

  updateStars(rating) {
    const stars = this.element.querySelectorAll("[data-rating]")
    stars.forEach((star) => {
      if (star.dataset.rating <= rating) {
        star.querySelector("[data-rating-target='star']").classList.remove("d-none")
        star.querySelector("[data-rating-target='emptyStar']").classList.add("d-none")
      } else {
        star.querySelector("[data-rating-target='star']").classList.add("d-none")
        star.querySelector("[data-rating-target='emptyStar']").classList.remove("d-none")
      }
    })
  }
}
