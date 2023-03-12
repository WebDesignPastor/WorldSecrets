import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questions"
export default class extends Controller {
  static targets = ["progress", "one", "two", "three", "four", "five", "six", "goodone", "badone"]

  connect() {
  }

  goodanswer1(event) {
    event.currentTarget.classList.remove('btn-outline-primary')
    event.currentTarget.style.backgroundColor = 'green'
    event.currentTarget.style.color = 'white'
    setTimeout(() => {
      this.progressTarget.classList.remove('progress-bar')
      this.progressTarget.classList.add('progress20')
      this.oneTarget.classList.add('d-none')
      this.twoTarget.classList.remove('d-none')
    }, 2000);
  }

  goodanswer2(event) {
    event.currentTarget.classList.remove('btn-outline-primary')
    event.currentTarget.style.backgroundColor = 'green'
    event.currentTarget.style.color = 'white'
    setTimeout(() => {
      this.progressTarget.classList.remove('progress20')
      this.progressTarget.classList.add('progress40')
      this.twoTarget.classList.add('d-none')
      this.threeTarget.classList.remove('d-none')
    }, 2000);
  }

  goodanswer3(event) {
    event.currentTarget.classList.remove('btn-outline-primary')
    event.currentTarget.style.backgroundColor = 'green'
    event.currentTarget.style.color = 'white'
    setTimeout(() => {
      this.progressTarget.classList.remove('progress40')
      this.progressTarget.classList.add('progress60')
      this.threeTarget.classList.add('d-none')
      this.fourTarget.classList.remove('d-none')
    }, 2000);
  }

  goodanswer4(event) {
    event.currentTarget.classList.remove('btn-outline-primary')
    event.currentTarget.style.backgroundColor = 'green'
    event.currentTarget.style.color = 'white'
    setTimeout(() => {
      this.progressTarget.classList.remove('progress60')
      this.progressTarget.classList.add('progress80')
      this.fourTarget.classList.add('d-none')
      this.fiveTarget.classList.remove('d-none')
    }, 2000);
  }

  goodanswer5(event) {
    event.currentTarget.classList.remove('btn-outline-primary')
    event.currentTarget.style.backgroundColor = 'green'
    event.currentTarget.style.color = 'white'
    setTimeout(() => {
      this.progressTarget.classList.remove('progress80')
      this.progressTarget.classList.add('progress100')
      this.fiveTarget.classList.add('d-none')
      this.sixTarget.classList.remove('d-none')
    }, 2000);
  }

  badanswer(event) {
    const element = event.currentTarget
    element.classList.remove('btn-outline-primary')
    element.classList.add('btn-primary')
    element.classList.add('btn-shake')
    setTimeout(() => {
      element.classList.remove('btn-primary')
      element.classList.add('btn-outline-primary')
      element.classList.remove('btn-shake')
    }, 2000);
  }
}
