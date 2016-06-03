Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'session#destroy'

  resources :tools
  resources :users, only: [:new, :create, :show]
end
