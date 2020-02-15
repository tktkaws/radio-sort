Rails.application.routes.draw do
  root 'radios#index'

  post 'tweet', to: 'twitter#tweet'
  post 'confirm', to: 'twitter#confirm'

  get 'ranking', to: 'radios#ranking'
  resources :radios do
    resources :comments
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:index, :show] do
    get :relations_index
  end

  resources :likes do
    put :sort
  end

  resources :relations, only: [:create, :destroy]
end
