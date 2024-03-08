import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["visual", "code"]

  connect() {
    this.element.querySelector("input").checked = false
  }

  toggle() {
    const state = this.element.querySelector("input").checked

    if (state) {
      this.visualTarget.classList.add("hidden")
      this.codeTarget.classList.remove("hidden")
    } else {
      this.visualTarget.classList.remove("hidden")
      this.codeTarget.classList.add("hidden")
    }
  }
}
