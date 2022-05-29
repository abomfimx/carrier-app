Rails.application.routes.draw do
  devise_for :users
  root to:  "home#index"
  resources :carriers, only: [:index, :show, :new, :create]
  resources :vehicules, only: [:index, :show, :new, :create]
  resources :carrier_prices, only: [:index, :new, :create, :edit, :update]
  resources :delivery_periods, only: [:index, :new, :create]
  resources :quotations, only: [:index, :create, :new]
  resources :customers, only: [:index, :new, :create]
  resources :products, only: [:index, :new, :create]
  resources :warehouses, only: [:index, :new, :create]
  resources :service_orders, only: [:index,:new, :create,:edit, :update, :show] do
    post 'delivered', on: :member
    post 'rejected', on: :member
    post 'approved', on: :member
  end
  resources :track_orders, only: [:index, :new, :create]
end
