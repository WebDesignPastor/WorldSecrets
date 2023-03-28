import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {
  static targets = ['emptyStar1', 'emptyStar2', 'emptyStar3', 'emptyStar4', 'emptyStar5',
                    'star1', 'star2', 'star3', 'star4', 'star5']
  connect() {
  }

  addRate1() {
    this.emptyStar1Target.classList.add('d-none')
    this.star1Target.classList.remove('d-none')
    this.emptyStar2Target.classList.remove('d-none')
    this.star2Target.classList.add('d-none')
    this.emptyStar3Target.classList.remove('d-none')
    this.star3Target.classList.add('d-none')
    this.emptyStar4Target.classList.remove('d-none')
    this.star4Target.classList.add('d-none')
    this.emptyStar5Target.classList.remove('d-none')
    this.star5Target.classList.add('d-none')
  }

  addRate2() {
    this.emptyStar1Target.classList.add('d-none')
    this.star1Target.classList.remove('d-none')
    this.emptyStar2Target.classList.add('d-none')
    this.star2Target.classList.remove('d-none')
    this.emptyStar3Target.classList.remove('d-none')
    this.star3Target.classList.add('d-none')
    this.emptyStar4Target.classList.remove('d-none')
    this.star4Target.classList.add('d-none')
    this.emptyStar5Target.classList.remove('d-none')
    this.star5Target.classList.add('d-none')
  }

  addRate3() {
    this.emptyStar1Target.classList.add('d-none')
    this.star1Target.classList.remove('d-none')
    this.emptyStar2Target.classList.add('d-none')
    this.star2Target.classList.remove('d-none')
    this.emptyStar3Target.classList.add('d-none')
    this.star3Target.classList.remove('d-none')
    this.emptyStar4Target.classList.remove('d-none')
    this.star4Target.classList.add('d-none')
    this.emptyStar5Target.classList.remove('d-none')
    this.star5Target.classList.add('d-none')
  }

  addRate4() {
    this.emptyStar1Target.classList.add('d-none')
    this.star1Target.classList.remove('d-none')
    this.emptyStar2Target.classList.add('d-none')
    this.star2Target.classList.remove('d-none')
    this.emptyStar3Target.classList.add('d-none')
    this.star3Target.classList.remove('d-none')
    this.emptyStar4Target.classList.add('d-none')
    this.star4Target.classList.remove('d-none')
    this.emptyStar5Target.classList.remove('d-none')
    this.star5Target.classList.add('d-none')
  }

  addRate5() {
    this.emptyStar1Target.classList.add('d-none')
    this.star1Target.classList.remove('d-none')
    this.emptyStar2Target.classList.add('d-none')
    this.star2Target.classList.remove('d-none')
    this.emptyStar3Target.classList.add('d-none')
    this.star3Target.classList.remove('d-none')
    this.emptyStar4Target.classList.add('d-none')
    this.star4Target.classList.remove('d-none')
    this.emptyStar5Target.classList.add('d-none')
    this.star5Target.classList.remove('d-none')
  }
}
