Rails.application.routes.draw do

  get 'city/show'
  get 'user/show'
  root 'home#index'

  get '/team', to: 'team#show'

  get '/contact', to: 'contact#show'

  get '/welcome/:first_name', to: 'welcome#say_hello', as: 'landing'

  resources :gossips do
    resources :like, only: [:new, :create, :destroy]
  end
  resources :user

  resources :city

  resources :comment 

  resources :sessions, only: [:new, :create, :destroy]

  #resources :like, only: [:new, :create, :destroy]

end
