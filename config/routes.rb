Rails.application.routes.draw do
  get 'secret_codes/index'
  root to: 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :secret_codes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
