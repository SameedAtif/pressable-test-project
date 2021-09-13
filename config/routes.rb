Rails.application.routes.draw do
  get :login, to: 'sessions#new'
  post :sessions, to: 'sessions#create'
  delete :sessions, to: 'sessions#destroy'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[show]
    end
  end

  resources :users, only: %i[create show edit update] do
    resources :friendships, only: %i[create destroy]
  end
  root 'sessions#new'
end
