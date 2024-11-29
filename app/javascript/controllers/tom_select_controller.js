import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    if (this.element) {
      this.initTomSelect()
    }
  }

  initTomSelect() {
    const select = new TomSelect(this.element, {
      create: false,
      sortField: {
        field: "text",
        direction: "asc"
      },
      maxItems: 1,
      maxOptions: 15,
      closeAfterSelect: true,
      render: {
        no_results: () => {
          return this.renderNoResults()
        }
      },
    })
    select.on("item_add", select.blur)
    const clear = () => select.clear(true)
    select.on("focus", clear)
  }

  renderNoResults() {
    const locale = document.location.pathname.split('/')[1]
    if (locale === "en") {
      return `<div class="no-results">Name not found</div>`
    } else {
      return `<div class="no-results">Pas de nom trouvé</div>`
    }
  }
}
