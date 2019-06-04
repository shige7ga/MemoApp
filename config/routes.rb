Rails.application.routes.draw do
  root 'description#index' 
  get "description/new" => "description#new"
  post "description/create" => "description#create"
end