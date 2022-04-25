Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  get 'contents/index'
  root to: "contents#index"
  post 'users/sign_up'
  resources :users
  resources :sessions
end
