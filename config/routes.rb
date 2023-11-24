Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  get 'groups/home', to: 'groups#home', as: 'groups_home'

  authenticated :user do
    root 'groups#home', as: :authenticated_root
  end

  unauthenticated do
    root 'groups#index', as: :unauthenticated_root
  end

  resources :groups, only: %i[index home new create destroy] do
    get :home, on: :collection
    resources :entities, only: %i[index new create destroy]
  end
end
