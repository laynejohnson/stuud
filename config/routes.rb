Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :dashboard, only: [:show], :controller => :dashboard
  resource :calendar, only: [:show], :controller => :calendar

  resources :clients, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :expenses, only: [:index, :new, :create]
end
