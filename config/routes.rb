Rails.application.routes.draw do
  resources :tenancies do
    resources :units
    resources :ratings
    resources :landlords
  end

  resources :ratings, only: %i(index show)
  resources :units, only: %i(index show)
  resources :landlords, only: %i(index show)
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#home'
end
