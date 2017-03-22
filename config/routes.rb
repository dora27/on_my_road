Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :users, only: [:show, :update] do
    member do
      get :profile
    end
  end
  resources :trajects, only: [:show, :edit, :update]  do
    resources :stops, only: [:create]
  end
  resources :requests, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
