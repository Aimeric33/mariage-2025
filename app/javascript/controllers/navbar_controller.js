import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
  }

  openMenu() {
    const hiddenMenu = this.menuTarget.classList.contains("hidden")
    const body = document.querySelector("body")
    if (hiddenMenu) {
      this.menuTarget.classList.remove("hidden")
      this.menuTarget.classList.add("block", "fixed", "left-0", "right-0", "top-0", "min-h-screen")
      body.classList.add("no-scroll")
    } else {
      this.menuTarget.classList.remove("block", "fixed", "left-0", "right-0", "top-0", "min-h-screen")
      this.menuTarget.classList.add("hidden")
      body.classList.remove("no-scroll")
    }
  }
}
