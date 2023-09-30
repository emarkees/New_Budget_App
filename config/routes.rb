Rails.application.routes.draw do
  resources :transactions
  resources :categories, only: [:index, :new, :create]
  devise_for :users
  get 'home/index'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories do
    resources :transactions
  end
end
