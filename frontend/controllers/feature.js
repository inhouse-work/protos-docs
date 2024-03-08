import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["visual", "code"]

  openCode() {
    this.visualTarget.classList.add("hidden")
    this.codeTarget.classList.remove("hidden")
  }

  openVisual() {
    this.visualTarget.classList.remove("hidden")
    this.codeTarget.classList.add("hidden")
  }
}
