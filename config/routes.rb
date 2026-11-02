Rails.application.routes.draw do
  # generate routes for managing a single session
  #
  # sessions#new
  # sessions#edit
  # sessions#create
  # sessions#destroy
  #
  # see all generated routes by running "bin/rails routes-g session"
  resource :session

  # generate routes for the password reset/update flow
  #
  # passwords#new
  # passwords#create
  # passwords#edit
  # passwords#update
  # see all generated routes by running "bin/rails routes-g passwords"
  resources :passwords, param: :token

  # generate routes for the managing registrations
  #
  # registrations#new
  # registrations#create
  #
  # only "new" and "create" actions are bounded to routes
  resource :registration, only: %i[new create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "splash#splash"

  get "/home", to: "home#index"
end
