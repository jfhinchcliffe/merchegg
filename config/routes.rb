Rails.application.routes.draw do
  get '/about', to: 'static_pages#index'

  get '/contact', to: 'static_pages#contact'

  root 'static_pages#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
