Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :users, only: [:show, :update]

  resources :trajects, only: [:show, :edit, :update]  do
    resources :stops, only: [:index, :create, :update]
  end
  resources :requests, only: [:new, :create, :show]
end
