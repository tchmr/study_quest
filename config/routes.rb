Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:index, :show] do
    resources :logs, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :enemies, only: [:index, :show] do
      resources :quests, only: :create
    end
  end
end
