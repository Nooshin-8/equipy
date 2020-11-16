Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :equipment do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :update, :destroy]

  # you will see the result of your search for a particular equipment
  get '/search_results', to: 'search_results#index'
end
