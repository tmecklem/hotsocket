Rails.application.routes.draw do
  devise_for :users

  resources :products
  resource :cart, only: [:show] do
    post "/add", to: "carts#add"
    post "/remove", to: "carts#remove"
  end
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
