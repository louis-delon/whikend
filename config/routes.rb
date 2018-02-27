Rails.application.routes.draw do

  get 'messages/new'

  root to: 'pages#home'
  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :trips do
    resources :submissions, except: [:update, :edit, :show]
    resources :messages, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
