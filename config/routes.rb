Rails.application.routes.draw do
  root to: "games#index"
  resources :users, :except => [:index]
  resources :games, :except => [:destroy, :edit, :update]
end
