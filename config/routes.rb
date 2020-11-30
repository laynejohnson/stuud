Rails.application.routes.draw do
  resources :events
  devise_for :users
  root to: 'dashboard#show'

  resource :dashboard, only: [:show], :controller => :dashboard
  resource :calendar, only: [:show], :controller => :calendar
  resource :finances, only: [:show], :controller => :finances

  resources :clients, only: [:index, :show, :new, :create, :edit, :update]
  resources :bookings, only: [:new, :show, :create, :edit, :update, :destroy]

  resources :expenses, only: [:index, :show, :new, :create]
end
