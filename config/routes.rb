Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show, :edit, :update]

  resources :trips do
    resources :submissions, except: [:update, :edit, :show]
    resources :messages, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

end
