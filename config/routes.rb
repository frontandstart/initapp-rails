Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'pages#index'

  mount HealthBit.rack => '/health'

  get '*path', to: 'pages#index', format: false, via: :get
end
