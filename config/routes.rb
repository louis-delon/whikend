Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :hikes
    resources :messages
    resources :reviews
    resources :submissions
    resources :trips

    root to: "users#index"
  end

  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show, :edit, :update]

  get 'trips/hikes_by_department', to: 'trips#hikes_by_department'
  resources :trips do
    resources :submissions, except: [:update, :edit, :show, :destroy]
    resources :messages, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :submissions, only: :destroy


  get 'trips/:trip_id/submissions/:id/approve', to: 'submissions#approve', as: :approve_submission
  get 'trips/:trip_id/submissions/:id/reject', to: 'submissions#reject', as: :reject_submission

end
