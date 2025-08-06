Rails.application.routes.draw do
  root to: 'pages#index'

  mount HealthBit.rack => '/health'

  authenticate :admin_user do
    mount ExceptionTrack::Engine => '/app-errors'
  end

  devise_for :admin_users
  devise_for :users

  get ':path', to: 'pages#index', as: :page
end
