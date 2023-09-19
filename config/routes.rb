Rails.application.routes.draw do
  get 'home/about'
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get 'signup', to:'users#new'
  resources :users, except: [:new]
end
