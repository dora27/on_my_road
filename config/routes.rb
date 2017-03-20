Rails.application.routes.draw do
 devise_for :users
  root to: 'pages#home'

  resources :trajects, only: [:show, :edit, :update]  do
    resources :stops, only: [:create, :show]
  end
  resources :requests, only: [:show]
end
