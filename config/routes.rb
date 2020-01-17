Rails.application.routes.draw do
  root 'radios#index'

  resources :radios
  devise_for :users
  resources :users
  resources :likes, only: [:create, :destroy] do
    put :sort
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
