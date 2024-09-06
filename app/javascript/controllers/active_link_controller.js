import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="active-link"
export default class extends Controller {
  static targets = ['link']

  connect() {
    this.linkTargets.forEach((link) => {
      if (link.href === window.location.href || link.href === window.location.hostname) {
        link.classList.add('border-b-2', 'border-primary-600')
      }
    })
  }
}
