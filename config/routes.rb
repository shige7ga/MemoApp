Rails.application.routes.draw do
  root 'description#index' 
  get "description/new" => "description#new"
  post "description/create" => "description#create"
  get "description/:id/details" => "description#details"
  get "description/:id/delete" => "description#delete"
  get "description/:id/edit" => "description#edit"
  post "description/:id/update" => "description#update"
end