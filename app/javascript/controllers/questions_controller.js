import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questions"
export default class extends Controller {
  static targets = ["progress", "question", "congratulation", "badAnswer"]
  currentIndex = -1
  progress = 0

  initialize() {
    this.nextIndex = this.currentIndex + 1
  }

  connect() {
    this.questionTargets[0].classList.remove('d-none') // to comment if you want to see congratulation first
    // this.congratulationTarget.classList.remove('d-none') // remove comment if you want to see congratulation first
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
        this.congratulationTarget.classList.remove('d-none')
      }
    }, 2000);

    this.currentIndex += 1
    this.progress += 20
    this.nextIndex = this.currentIndex + 1
  }

  badAnswer(event) {
    event.currentTarget.classList.remove('btn-outline-primary')
    event.currentTarget.classList.add('btn-primary')
    event.currentTarget.classList.add('btn-shake')
    setTimeout(() => {
      this.badAnswerTargets.forEach(answer => {
        answer.classList.remove('btn-primary')
      })
      this.badAnswerTargets.forEach(answer => {
        answer.classList.remove('btn-shake')
      })
      this.badAnswerTargets.forEach(answer => {
        answer.classList.add('btn-outline-primary')
      })
    }, 2000);
  }

  confettis() {

  }
}
