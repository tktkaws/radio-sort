Rails.application.routes.draw do
  root 'top#index'

  get 'ranking', to: 'radios#ranking'
  get 'timetable_tbs', to: 'timetable#tbs'
  get 'timetable_lfr', to: 'timetable#lfr'
  get 'timetable_fmj', to: 'timetable#fmj'
  get 'timetable_tfm', to: 'timetable#tfm'

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

  resources :users, only: %i[index show] do
    get :relations_index
  end

  resources :likes do
    put :sort
  end
  resources :relations, only: %i[create destroy]

  post 'tweet', to: 'twitter#tweet'
  post 'confirm', to: 'twitter#confirm'
end
