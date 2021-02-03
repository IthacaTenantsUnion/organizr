Rails.application.routes.draw do
  namespace :union do
    resources :landlords
    resources :units

    resources :tenancies do
      resources :ratings
    end
  end
  
  resources :ratings, only: %i(index show)
  
  resources :units, only: %i(index show) do
    resources :ratings, only: %i(index show)
  end
  resources :landlords, only: %i(index show) do
    resources :ratings, only: %i(index show)
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'landlords#index'
end
