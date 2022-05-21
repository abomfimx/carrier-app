Rails.application.routes.draw do
  root to:  "home#index"
  resources :carriers, only: [:index, :show, :new, :create]
  resources :vehicules, only: [:index, :show, :new, :create]
  resources :carrier_prices, only: [:index, :new, :create, :edit, :update]
  resources :delivery_periods, only: [:index, :new, :create]
end
