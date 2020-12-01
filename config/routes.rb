Rails.application.routes.draw do
  patch 'events/:event_id/paid', to: 'events#mark_as_paid', as: :paid
  resources :events
  devise_for :users
  root to: 'dashboard#show'

  resource :dashboard, only: [:show], :controller => :dashboard
  resource :calendar, only: [:show], :controller => :calendar
  resource :finances, only: [:show], :controller => :finances
  post 'invoices/:id/send_email', to: "invoices#send_email", as: :invoice_send_email
  resources :invoices

  resources :clients, only: [:index, :show, :new, :create, :edit, :update]
  resources :bookings, only: [:new, :show, :create, :edit, :update, :destroy]

  resources :expenses, only: [:index, :show, :new, :create]
end
