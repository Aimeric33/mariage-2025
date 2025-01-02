import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-guests"
export default class extends Controller {
  static targets = ["form", "loader"]

  connect() {
  }

  submit(event) {
    event.preventDefault()
    const locale = document.location.pathname.split('/')[1]

    // Désactivez le bouton et affichez le loader
    const button = event.target;
    button.disabled = true;
    this.loaderTarget.style.display = 'inline-block';
    if (locale === 'fr') {
      button.innerHTML = 'Chargement...';
    } else {
      button.innerHTML = 'Loading...';
    }

    // Créez un tableau de promesses pour chaque formulaire pour attendre qu'ils soient tous soumis
    const promises = this.formTargets.map((form) => {
      return fetch(form.action, {
        method: 'PATCH',
        body: new FormData(form)
      });
    });

    // Attendre que toutes les promesses soient résolues avant de faire le fetch GET
    Promise.all(promises).then(() => {
      console.log('Forms submitted');
      return fetch(`/${locale}/rsvp`, {
        method: 'GET'
      });
    })
      .then(response => response.text())
      .then(html => {
        document.body.innerHTML = html;
        window.scrollTo(0, 0)
      })
      .catch(error => {
        console.error('An error occurred:', error);
      });
  }
}
