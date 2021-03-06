Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end
  get '/usercodedboxes', to: 'user_coded_boxes#index'
  get 'codes/index'

  get 'payments/new'

  get 'payments/create'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  root 'static_pages#index'

  resources :profiles
  resources :boxes do
    resources :items
    resources :codes
    member do
      post 'sms'
    end
  end
  
  resources :payments, only: [:index, :new, :create]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
