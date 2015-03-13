Rails.application.routes.draw do

  root 'info#index'

  devise_for :admins, controllers: { sessions: "admin/sessions", registrations: "admin/registrations", 
    confirmations: "admin/confirmations", passwords: "admin/passwords" }
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}

  namespace :admin do
    get 'dashboard/index'
    get 'dashboard/event_facebook/:id', to: 'dashboard#event_facebook'
    get 'admins/index'
    get 'admins/show'
    resources :camps
    resources :camp_applications, only: [:index, :show, :edit, :update, :destroy] do
      resources :payments, except: [:show]
    end
    resources :admin_profiles, only: [:new, :show, :create, :edit, :update, :destroy]
  end
  resources :profiles
  resources :camp_applications
  resources :coach_comments, only: [:new, :create]

  get 'info/about'
  get 'info/privacy'
  get 'info/license'
  get 'profiles/send_reminder_email/:id', to: 'profiles#send_reminder_email'


end
