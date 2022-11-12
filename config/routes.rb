Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes
  #get "recipes", to: "recipes#index"
  #get "recipes/new", to: "recipes#new"
  #get "recipes/:id", to: "recipes#show"
  #post "recipes", to: "recipes#create"
  #get "recipes/:id/edit", to: "recipes#edit"
  #patch "recipes/:id", to: "recipes#update"
  #delete "restaurants/:id", to: "restaurants#destroy"
end
