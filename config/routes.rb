Rails.application.routes.draw do


  devise_for :admin, controllers: {invitations: "admin/invitations"}

  devise_for :users, controllers: {registrations: "registrations"}

  devise_scope :user do
    get 'admin-edit/:id', controller: 'registrations', action: 'admin_edit', as: 'admin_user_edit'
    put 'admin-edit/:id', controller: 'registrations', action: 'admin_update_user'
    delete 'admin-edit/:id', controller: 'registrations', action: 'admin_remove_user', as: 'admin_user_delete'
  end

  namespace :admin do
    get 'dashboard/index'
    get 'dashboard/event_facebook/:id', to: 'dashboard#event_facebook'
    get 'reports/status'
    # get 'reports/shuttle'
    get 'reports/financial'
    get 'reports/registration'
    get 'reports/nametags'

    resources :camps
    resources :camp_applications, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :payments, except: [:show]
      resources :staff_responses, except: [:index]
      get 'staff_responses/send_notification/:id', to: 'staff_responses#send_notification'
    end
    resources :admin_profiles
    resources :admins, only: [:index, :show, :edit, :update, :destroy]
  end
  resources :profiles
  resources :scholarships, only: [:index, :new, :edit, :create, :update, :destroy] do
    member do
      patch 'toggle_approval'
    end
  end
  resources :camp_applications do
    resources :payments, only: [:index, :create]
    member do
     get :new_application_payment
     post :pay
    end
 
  end
  resources :coach_comments, only: [:new, :create]

  get 'info/about'
  get 'info/privacy'
  get 'info/license'
  get 'profiles/send_reminder_email/:id', to: 'profiles#send_reminder_email'

  root 'info#index'

end
