Rails.application.routes.draw do
  root 'radios#index'

  get 'search', to: 'radios#search'
  resources :radios do
    resources :comments
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:index, :show] do
    get :show_relations
  end

  resources :likes do
    put :sort
  end

  resources :relations, only: [:create, :destroy]
end
