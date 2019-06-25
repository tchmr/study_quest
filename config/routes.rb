Rails.application.routes.draw do
  devise_for :users
  root 'top#top'
  get '/top', to: 'top#top'
  get '/about', to: 'top#about'
  get '/groups/:group_id/enemies/:enemy_id/quests/win', to: 'quests#win'
  get '/groups/:group_id/enemies/:enemy_id/quests/lose', to: 'quests#lose'
  resources :users, only: [:index, :show] do
    resources :logs, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :enemies, only: [:index, :show] do
      resources :quests, only: [:create, :destroy]
    end
  end
  resources :records, only: :create
end
