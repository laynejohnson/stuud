Rails.application.routes.draw do
  resources :events
  devise_for :users
  root to: 'pages#home'

  resource :dashboard, only: [:show], :controller => :dashboard
  resource :calendar, only: [:show], :controller => :calendar

  resources :clients, only: [:index, :show, :new, :create]
  resources :bookings, only: [:new, :create, :destroy]

  resources :expenses, only: [:index, :new, :create]
end
