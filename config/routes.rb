Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes do
    resources :reviews, only: [:new, :create]
  end
  resources :bookmarks
  resources :reviews, only: [:destroy]
end
