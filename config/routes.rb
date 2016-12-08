Rails.application.routes.draw do
<<<<<<< HEAD
  root "sessions#new"
   resources :games
  resources :sessions
  resources :users
  resources :shots, only: [:create, :index]
=======
  root to: "users#new"
  resources :users, :except => [:index]
  resources :games, :except => [:edit, :update, :destroy]
  resources :sessions, only: [:new, :create]
  delete "/logout" => "sessions#destroy"

>>>>>>> origin/game
end
