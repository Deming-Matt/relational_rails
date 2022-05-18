Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id', to: 'teams#show'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/teams/:id/players', to: 'team_players#index'
  post '/teams', to: 'teams#create'
  get '/teams/:id/edit', to: 'teams#edit', as: :edit_team
  patch '/teams/:id', to: 'teams#update'
  get '/teams/:id/players/new', to: 'team_players#new'
  post '/teams/:id/players', to: 'team_players#create'
end
