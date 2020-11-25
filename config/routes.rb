Rails.application.routes.draw do
  resources :events
  devise_for :users
  root to: 'pages#home'

  resource :dashboard, only: [:show], :controller => :dashboard
  resource :calendar, only: [:show], :controller => :calendar
  resource :finances, only: [:show], :controller => :finances

  resources :clients, only: [:index, :show, :new, :create]
  resources :bookings, only: [:new, :create, :edit, :update, :destroy]

  resources :expenses, only: [:index, :show, :new, :create]
end
