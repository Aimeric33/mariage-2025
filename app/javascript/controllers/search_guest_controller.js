import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-guest"
export default class extends Controller {
  static targets = ["input", "editFrame"]

  connect() {
  }

  search(event) {
    event.preventDefault()
    const searchId = this.inputTarget.value
    this.editFrameTarget.id = `edit_form_${searchId}`
    const locale = document.location.pathname.split('/')[1]
    if (searchId === "") {
      Turbo.visit(`/${locale}/rsvp`, { frame: `edit_form` })
    } else {
      this.editGuest(searchId)
    }
  }

  editGuest(searchId) {
    const locale = document.location.pathname.split('/')[1]
    Turbo.visit(`/${locale}/guests/${searchId}/edit`, { frame: `edit_form_${searchId}` })
  }
}
