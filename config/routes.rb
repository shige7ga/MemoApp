Rails.application.routes.draw do
  get 'users/index'

  root 'descriptions#index'
  resources :descriptions
  post "descriptions/allDelete"
end