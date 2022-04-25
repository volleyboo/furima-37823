Rails.application.routes.draw do
  devise_for :users
  get 'contents/index'
  root to: "contents#index"
  post 'users/sign_up'
  resources :users
end
