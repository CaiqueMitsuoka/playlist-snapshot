Rails.application.routes.draw do
  root to: "users#index"

  get '/auth/spotify/callback', to: 'users#create'

  resources :snapshots, only: [:create, :new]
end
