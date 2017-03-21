Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :trajects, only: [:show, :edit, :update]  do
    resources :stops, only: [:create]
  end
  resources :requests, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
