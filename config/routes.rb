Rails.application.routes.draw do
  resources :friendships
  resources :leagues
  resources :users
  post '/signup', to: 'users#signup'
  post '/login', to: 'auth#login'
  
end
