import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="registration"
export default class extends Controller {
  static targets = [
    "pageTitle", "registrationForm", "registrationButton",
    "goingFurther", "sharedLinks", "confidentialPolicy"
  ]

  connect() {
  }

  confidentialPolicyAppear() {
    this.pageTitleTarget.classList.add("d-none")
    this.registrationFormTarget.classList.add("d-none")
    this.goingFurtherTarget.classList.add("d-none")
    this.sharedLinksTargets.forEach((link) => {
      link.classList.add("d-none")
    })
    this.confidentialPolicyTarget.classList.remove("d-none")
  }

  acceptConfidentialPolicy(event) {
    event.preventDefault()
    this.pageTitleTarget.classList.remove("d-none")
    this.registrationFormTarget.classList.remove("d-none")
    this.sharedLinksTargets.forEach((link) => {
      link.classList.remove("d-none")
    })
    this.confidentialPolicyTarget.classList.add("d-none")
    this.registrationButtonTarget.classList.remove("d-none")
  }
}
