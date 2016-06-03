Rails.application.routes.draw do

  resources :tools
  resources :users, only: [:new, :create, :show]
end
