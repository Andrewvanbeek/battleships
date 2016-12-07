Rails.application.routes.draw do
  root "sessions#new"
   resources :games
  resources :sessions
  resources :users
  resources :shots, only: [:create, :index]
end
