Rails.application.routes.draw do
  root 'users#show'
  get '/spa', to: 'spa#index'
  devise_for :users

  resources :users do
    resources :lists
  end
  resources :lists do
    resources :items
  end
end
