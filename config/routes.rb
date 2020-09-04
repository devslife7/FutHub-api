Rails.application.routes.draw do
  resources :user_leagues
  resources :friendships
  resources :leagues
  resources :users
  post '/signup', to: 'users#signup'
  post '/login', to: 'auth#login'
  get '/friends/:id', to: 'users#friends'
  post '/user_leagues', to: 'user_leagues#create'
  
end
