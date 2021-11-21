Rails.application.routes.draw do
  devise_for :admin_users, skip: [:sessions], path: '', controllers: { omniauth_callbacks: 'auth/admin_omniauth_callbacks' }  
  namespace :auth do
    devise_scope :admin_user do
      get 'sign_in_admin', to: 'admin_sessions#new', as: :new_admin_session
      get 'sign_out_admin', to: 'admin_sessions#destroy', as: :destroy_admin_session
    end
  end

  namespace :admin do
    resources :admin_users, only: %i[index]
  end

  root to: "application#home"
end