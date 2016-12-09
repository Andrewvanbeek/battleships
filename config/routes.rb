Rails.application.routes.draw do
  root to: "games#index"
  resources :users, :except => [:index]
  resources :games, :except => [:edit, :update, :destroy] do
    resources :ships
    resources :shots, only: [:create, :index]
  end
  resources :sessions, only: [:new, :create]


  delete "/logout" => "sessions#destroy"

end
