Rails.application.routes.draw do
  get 'contents/index'
  root to: "contents#index"
end
