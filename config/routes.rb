Rails.application.routes.draw do
  root to: 'pages#index'

  # Заявки
  resources :orders, only: [:create]

  # Портфолио
  get 'portfolio', to: 'projects#index', as: :portfolio
  get 'portfolio/:id', to: 'projects#show', as: :project

  # Контакты
  get 'contacts', to: 'pages#contacts', as: :contacts

  mount HealthBit.rack => '/health'

  authenticate :admin_user do
    mount ExceptionTrack::Engine => '/app-errors'
  end

  devise_for :admin_users
  devise_for :users

  get ':path', to: 'pages#index', as: :page
end
