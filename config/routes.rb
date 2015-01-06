Rails.application.routes.draw do

  root 'info#index'

  devise_for :admins, controllers: { sessions: "admin/sessions", registrations: "admin/registrations", 
    confirmations: "admin/confirmations", passwords: "admin/passwords" }
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}

  namespace :admin do
    get 'dashboard/index'
    get 'admins/index'
    get 'admins/show'
    resources :camps
    resources :camp_apps, only: [:index, :show, :edit, :update, :destroy]
  end
  resources :profiles
  resources :camp_applications
  resources :coach_comments, only: [:new, :create]

  get 'info/about'
  get 'info/privacy'
  get 'info/license'


end
