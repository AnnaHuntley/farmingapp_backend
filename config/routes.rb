Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Define routes for the crops
  resources :crops
  root to: 'crops#index'

  # Add route to handle OPTIONS requests
  match '*path', to: 'application#handle_options_request', via: :options
end
