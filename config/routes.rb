Rails.application.routes.draw do
  namespace :admin do
    resources :tenancies, only: %i(index)
  end

  namespace :union do
    resources :tenancies
  end
  
  get 'ratings', to: 'tenancies#index', as: :ratings
  get 'ratings/:id', to: 'tenancies#show', as: :rating
  
  resources :units, only: %i(index show) do
    get :search, on: :collection
  end
  
  resources :landlords, only: %i(index show) do
    get :search, on: :collection
  end
  
  put 'profile', to: 'profiles#update'
  get 'profile', to: 'profiles#show'
  get 'profile/edit', to: 'profiles#edit'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'landlords#index'
end
