Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'booking', to: 'pages#booking'

  resources :flats do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:show, :index]
end
