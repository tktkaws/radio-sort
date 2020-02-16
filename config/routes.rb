Rails.application.routes.draw do
  root 'top#index'


  get 'ranking', to: 'radios#ranking'
  resources :radios do
    resources :comments
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:index, :show] do
    get :relations_index
  end

  resources :likes do
    put :sort
  end
  resources :relations, only: [:create, :destroy]

  post 'tweet', to: 'twitter#tweet'
  post 'confirm', to: 'twitter#confirm'
end
