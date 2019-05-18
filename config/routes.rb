Rails.application.routes.draw do
  devise_for :users
  root 'logs#show'
  resources :logs, only: [:show, :create, :update]
end
