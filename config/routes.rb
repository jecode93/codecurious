Rails.application.routes.draw do
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  constraints subdomain: "admin" do
    devise_for :admins, path: "", path_names: { sign_in: "login", sign_out: "logout" }
    scope module: "admin" do
      root "dashboard#index", as: "admin_dashboard"
      resources :profiles, only: %i[show edit update]
      resources :articles, as: "admin_articles"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  constraints subdomain: /^www$|^$/ do
    root "articles#index" # Main blog homepage
    resources :articles, only: %i[index show]
    resources :authors, only: %i[show]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
