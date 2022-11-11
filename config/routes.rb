Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "recipes", to: "recipes#index"
  get "recipes/new", to: "recipes#new"
  get "recipes/:id", to: "recipes#show"
end
