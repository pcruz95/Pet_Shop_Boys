Rails.application.routes.draw do
  get 'users/show'
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :pets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:show, :new, :create, :destroy]
  end
  # has this fucked up everything???
  resources :bookings do
    resources :reviews, only: [:create]
  end
end
