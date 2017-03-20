Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :trajects, only: [:show, :edit, :update]  do
    resources :stops, only: [:create]
  end
  resources :requests, only: [:show]
end
