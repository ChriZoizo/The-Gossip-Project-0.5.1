Rails.application.routes.draw do

  get 'city/show'
  get 'user/show'
  root 'home#index'

  get '/team', to: 'team#show'

  get '/contact', to: 'contact#show'

  get '/welcome/:first_name', to: 'welcome#say_hello', as: 'landing'

  resources :gossips

  resources :user

  resources :city

end
