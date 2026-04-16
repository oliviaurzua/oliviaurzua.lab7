Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root "owners#index"
  
  get "/owners", to: "owners#index", as: "owners"
  get "/owners/:id", to: "owners#show", as: "owner"

  get "/pets", to: "pets#index", as: "pets"
  get "/petss/:id", to: "pets#show", as: "pet"

  get "/vets", to: "vets#index", as: "vets"
  get "/vets/:id", to: "vets#show", as: "vet"

  get "/appointments", to: "appointments#index", as: "appointments"
  get "/appointments/:id", to: "appointments#show", as: "appointment"
end
