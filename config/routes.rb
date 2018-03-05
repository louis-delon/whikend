Rails.application.routes.draw do

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

  get 'trips/:trip_id/submissions/:id/select', to: 'submissions#select', as: :select_submission
    get 'trips/:trip_id/submissions/:id/reject', to: 'submissions#reject', as: :reject_submission

end
