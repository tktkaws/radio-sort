Rails.application.routes.draw do
  root 'top#index'

  get 'ranking', to: 'radios#ranking'
  #get 'timetable', to: 'radios#timetable'
  #get 'timetable_tbs', to: 'radios#timetable_tbs'
  #get 'timetable_lfr', to: 'radios#timetable_lfr'
  #get 'timetable_fmj', to: 'radios#timetable_fmj'
  #get 'timetable_tfm', to: 'radios#timetable_tfm'
  scope :timetable do
    get 'tbs', to: 'radios#tbs'
    get 'lfr', to: 'radios#lfr'
    get 'fmj', to: 'radios#fmj'
    get 'tfm', to: 'radios#tfm'
  end

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
