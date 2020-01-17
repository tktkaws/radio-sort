Rails.application.routes.draw do
  root 'radios#index'
  resources :radios
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
