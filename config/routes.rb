Rails.application.routes.draw do
  devise_for :users
  root to:  "home#index"
  resources :carriers, only: [:index, :show, :new, :create]
  resources :vehicules, only: [:index, :show, :new, :create]
  resources :carrier_prices, only: [:index, :new, :create, :edit, :update]
  resources :delivery_periods, only: [:index, :new, :create]

  resources :customers, only: [:index, :new, :create]
  resources :products, only: [:index, :new, :create]
  resources :warehouses, only: [:index, :new, :create]
  resources :service_orders, only: [:index,:new, :create,:edit, :update, :show] do
    post 'delivered', on: :member
    post 'rejected', on: :member
    post 'approved', on: :member
  end
  resources :track_orders, only: [:index, :new, :create] do
    get 'search', on: :collection
  end

  resources :quotations, only: [:index, :create, :new, :show] do
    resources :quotation_details, only: [:new, :create]
  end
  get '/quotations/:quotation_id/quotation_details/:id', to: 'quotation_details#list', as: 'list_quotation_detail'
end