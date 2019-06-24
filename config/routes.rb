Rails.application.routes.draw do
  root 'descriptions#index'
  resources :descriptions
  post "descriptions/allDelete"
end