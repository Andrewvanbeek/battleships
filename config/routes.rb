Rails.application.routes.draw do
  root to: "users#new"
  resources :users, :except => [:index]
  resources :sessions, only: [:new, :create]
  delete "/logout" => "sessions#destroy"
end
