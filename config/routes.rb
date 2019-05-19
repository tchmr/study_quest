Rails.application.routes.draw do
  devise_for :users
  root 'logs#show'
  resources :users, only: [:index, :show] do
    resources :logs, only: [:show, :new, :create, :edit, :update, :destroy]
  end
end
