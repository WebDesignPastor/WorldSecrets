import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questions"
export default class extends Controller {
  static targets = ["progress", "question", "six"]
  currentIndex = -1
  progress = 0

  initialize() {
    this.nextIndex = this.currentIndex + 1
  }

  connect() {
    this.questionTargets[0].classList.remove('d-none')
    console.log('je crois que ça y est')
  }

  goodAnswer(event) {
    event.currentTarget.classList.remove('btn-outline-primary')
    event.currentTarget.style.backgroundColor = 'green'
    event.currentTarget.style.color = 'white'

    setTimeout(() => {
      this.progressTarget.classList.add(`progress${this.progress}`)
      this.questionTargets[this.currentIndex].classList.add('d-none')

      if (this.nextIndex < this.questionTargets.length) {
        this.questionTargets[this.currentIndex].classList.add('d-none')
        this.questionTargets[this.nextIndex].classList.remove('d-none')
      } else {
        this.questionTargets[this.currentIndex].classList.add('d-none')
        this.sixTarget.classList.remove('d-none')
      }
    }, 2000);

    this.currentIndex += 1
    this.progress += 20
    this.nextIndex = this.currentIndex + 1
  }

  // goodAnswer1(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   let count = 0
  //   count += 20
  //   setTimeout(() => {
  //     this.progressTarget.classList.add(`progress${count}`)
  //     this.questionTargets[0].classList.add('d-none')
  //     this.questionTargets[1].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodAnswer2(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   let count = 0
  //   count += 40
  //   setTimeout(() => {
  //     this.progressTarget.classList.add(`progress${count}`)
  //     this.questionTargets[1].classList.add('d-none')
  //     this.questionTargets[2].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodAnswer3(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   let count = 0
  //   count += 60
  //   setTimeout(() => {
  //     this.progressTarget.classList.add(`progress${count}`)
  //     this.questionTargets[2].classList.add('d-none')
  //     this.questionTargets[3].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodAnswer4(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   let count = 0
  //   count += 80
  //   setTimeout(() => {
  //     this.progressTarget.classList.add(`progress${count}`)
  //     this.questionTargets[3].classList.add('d-none')
  //     this.questionTargets[4].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodAnswer5(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   let count = 0
  //   count += 100
  //   setTimeout(() => {
  //     this.progressTarget.classList.add(`progress${count}`)
  //     this.questionTargets[4].classList.add('d-none')
  //     this.sixTarget.classList.remove('d-none')
  //   }, 2000);
  // }

  // goodanswer1(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   setTimeout(() => {
  //     this.progressTarget.classList.remove('progress-bar')
  //     this.progressTarget.classList.add('progress20')
  //     this.questionTargets[0].classList.add('d-none')
  //     this.questionTargets[1].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodanswer2(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   setTimeout(() => {
  //     this.progressTarget.classList.remove('progress20')
  //     this.progressTarget.classList.add('progress40')
  //     this.questionTargets[1].classList.add('d-none')
  //     this.questionTargets[2].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodanswer3(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   setTimeout(() => {
  //     this.progressTarget.classList.remove('progress40')
  //     this.progressTarget.classList.add('progress60')
  //     this.questionTargets[2].classList.add('d-none')
  //     this.questionTargets[3].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodanswer4(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   setTimeout(() => {
  //     this.progressTarget.classList.remove('progress60')
  //     this.progressTarget.classList.add('progress80')
  //     this.questionTargets[3].classList.add('d-none')
  //     this.questionTargets[4].classList.remove('d-none')
  //   }, 2000);
  // }

  // goodanswer5(event) {
  //   event.currentTarget.classList.remove('btn-outline-primary')
  //   event.currentTarget.style.backgroundColor = 'green'
  //   event.currentTarget.style.color = 'white'
  //   setTimeout(() => {
  //     this.progressTarget.classList.remove('progress80')
  //     this.progressTarget.classList.add('progress100')
  //     this.questionTargets[4].classList.add('d-none')
  //     this.sixTarget.classList.remove('d-none')
  //   }, 2000);
  // }

  // badanswer(event) {
  //   const element = event.currentTarget
  //   element.classList.remove('btn-outline-primary')
  //   element.classList.add('btn-primary')
  //   element.classList.add('btn-shake')
  //   setTimeout(() => {
  //     element.classList.remove('btn-primary')
  //     element.classList.add('btn-outline-primary')
  //     element.classList.remove('btn-shake')
  //   }, 2000);
  // }
}
