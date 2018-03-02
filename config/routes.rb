Rails.application.routes.draw do

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show, :edit, :update]

  get 'trips/hikes_by_department', to: 'trips#hikes_by_department'
  resources :trips do
    resources :submissions, except: [:update, :edit, :show]
    resources :messages, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
end
