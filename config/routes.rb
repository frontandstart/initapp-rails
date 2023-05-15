Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :admin do
    resources :users

    root to: 'users#index'
  end

  mount HealthBit.rack => '/health'

  get '*path', to: 'pages#index', format: false, via: :get
end
