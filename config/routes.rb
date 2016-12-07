Rails.application.routes.draw do
  root to: "games#index"
  resources :users, :except => [:index]
  resources :games
  resources :sessions, only: [:new, :create]
   delete "/logout" => "sessions#destroy"
end
