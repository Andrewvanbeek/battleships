Rails.application.routes.draw do
  root "users#show"
  resources :sessions
  resources :users
  resources :games
end
