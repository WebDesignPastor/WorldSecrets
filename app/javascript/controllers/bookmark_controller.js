import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "button" ]

  submit(event) {
    event.preventDefault()
    this.formTarget.requestSubmit()
  }
}
