Rails.application.routes.draw do
  resources :teams
  resources :user_invitations
  resources :invitations
  resources :user_watchparties
  resources :watchparties
  resources :user_leagues, only: [:create]
  resources :friendships
  resources :leagues, only: [:index]
  resources :users

  post '/signup', to: 'users#signup'
  post '/login', to: 'auth#login'

  get '/friends/:id', to: 'users#friends'
  post '/friendships/remove', to: 'friendships#remove'

  get '/leagues/popular', to: 'leagues#popular'
  get '/leagues/international', to: 'leagues#international'

  post '/favLeagues/add', to: 'user_leagues#create'
  delete '/favLeagues/remove/:id', to: 'user_leagues#destroy'

  post 'fixtures/date', to: 'api_calls#fixtures_by_date'

  patch '/uploadAvatar/:id', to: 'users#upload_avatar'

  post '/user_invitations/remove', to: 'user_invitations#remove'
  
end
