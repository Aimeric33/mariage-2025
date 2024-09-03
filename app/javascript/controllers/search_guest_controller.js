import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-guest"
export default class extends Controller {
  static targets = ["input", "editFrame"]

  connect() {
  }

  search(event) {
    event.preventDefault()
    const searchId = this.inputTarget.value
    console.log(searchId)
    this.editFrameTarget.id = `edit_form_${searchId}`
    console.log(this.editFrameTarget.id)
    const locale = document.location.pathname.split('/')[1]
    Turbo.visit(`/${locale}/guests/${searchId}/edit`, { frame: `edit_form_${searchId}` })
  }
}
