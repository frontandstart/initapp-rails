Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount HealthBit.rack => '/health'

  root to: 'pages#index'

  devise_for :admins
  devise_for :users
  get '*path', to: 'pages#index', format: false, via: :get
end
