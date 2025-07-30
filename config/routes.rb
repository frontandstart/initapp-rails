Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  mount HealthBit.rack => '/health'
  authenticate :admin_user do
    mount ExceptionTrack::Engine => '/app-errors'
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#index'

  get ':path', to: 'pages#index', as: :page
end
