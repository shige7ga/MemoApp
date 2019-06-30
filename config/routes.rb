Rails.application.routes.draw do
  root 'descriptions#index'
  
  get "login", to: "users#login_form"
  post "login", to: "users#login"
  post "logout", to: "users#logout"
  
  # descritptions
  resources :descriptions
  post "descriptions/allDelete"
  
  # users
  resources :users
  
  
end