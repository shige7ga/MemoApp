Rails.application.routes.draw do
  root 'descriptions#index'
  
  # descritptions
  resources :descriptions
  post "descriptions/allDelete"
  
  # users
  resources :users
  
end