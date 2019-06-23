Rails.application.routes.draw do
  root 'descriptions#index'
  resources :descriptions
  post "descriptions/allDelete" => "descriptions#allDelete"
end