Rails.application.routes.draw do
  get 'relations/create'
  get 'relations/destroy'
  root 'radios#index'

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
