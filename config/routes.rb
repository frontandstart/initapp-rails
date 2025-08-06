Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  mount HealthBit.rack => '/health'

  authenticate :admin_user do
    # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount ExceptionTrack::Engine => '/app-errors'
  end

  root to: 'pages#index'

  get ':path', to: 'pages#index', as: :page
end
