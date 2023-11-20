Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "groups#index"

  resources :groups, only: %i[index show new create destroy]
  resources :entities, only: %i[index new create destroy]

  # Defines the root path route ("/")
  # root "posts#index"
end
