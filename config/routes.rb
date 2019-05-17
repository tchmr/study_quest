Rails.application.routes.draw do
  root 'logs#show'
  resources :logs, only: [:show, :create, :update]
end
