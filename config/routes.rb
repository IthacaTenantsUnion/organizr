Rails.application.routes.draw do
  resources :units
  resources :ratings
  resources :landlords
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'ratings#index'
end
