Rails.application.routes.draw do
  resources :user_leagues
  resources :friendships
  resources :leagues, only: [:index]
  resources :users
  post '/signup', to: 'users#signup'
  post '/login', to: 'auth#login'
  get '/friends/:id', to: 'users#friends'
  post '/friendships/remove', to: 'friendships#remove'
  # post '/user_leagues', to: 'user_leagues#create'
  get '/leagues/popular', to: 'leagues#popular'
  get '/leagues/international', to: 'leagues#international'
  
end
