Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :pets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:show, :new, :create, :destroy]
  end
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/destroy'
  # get 'pets/index'
  # get 'pets/show'
  # get 'pets/new'
  # get 'pets/create'
  # get 'pets/edit'
  # get 'pets/update'
end
