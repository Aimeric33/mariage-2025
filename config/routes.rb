Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
  get '/:locale', to: "pages#home"

  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    ActiveAdmin.routes(self)
    devise_for :users
    get '/infos-pratiques', to: "pages#infos_pratiques"
    get '/a-visiter', to: "pages#a_visiter"
    get '/rsvp', to: "pages#rsvp"
    get '/mentions-legales', to: "pages#mentions_legales"

    resources :guests, only: [:edit, :update]
  end
end
