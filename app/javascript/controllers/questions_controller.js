import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questions"
export default class extends Controller {
  static targets = ["progress", "one", "two", "three", "four", "five", "six", "goodone", "badone"]

  connect() {
  }

  goodanswer1() {
    this.oneTarget.classList.add('d-none')
    this.twoTarget.classList.remove('d-none')
    this.progressTarget.classList.remove('progress-bar')
    this.progressTarget.classList.add('progress20')
    // this.progressTarget.style.transform = 'scaleX(0.2)'
  }

  goodanswer2() {
    this.twoTarget.classList.add('d-none')
    this.threeTarget.classList.remove('d-none')
    this.progressTarget.classList.remove('progress20')
    this.progressTarget.classList.add('progress40')
  }

  goodanswer3() {
    this.threeTarget.classList.add('d-none')
    this.fourTarget.classList.remove('d-none')
    this.progressTarget.classList.remove('progress40')
    this.progressTarget.classList.add('progress60')
  }

  goodanswer4() {
    this.fourTarget.classList.add('d-none')
    this.fiveTarget.classList.remove('d-none')
    this.progressTarget.classList.remove('progress60')
    this.progressTarget.classList.add('progress80')
  }

  goodanswer5() {
    this.fiveTarget.classList.add('d-none')
    this.sixTarget.classList.remove('d-none')
    this.progressTarget.classList.remove('progress80')
    this.progressTarget.classList.add('progress100')
  }

  badanswer(event) {
    const element = event.currentTarget;
    element.classList.add('btn-shake');
    setTimeout(() => {
      element.classList.remove('btn-shake');
    }, 5000);
  }
}
