Rails.application.routes.draw do
  root 'users#show'
  post 'text', to: 'text_messages#create'
  get '/spa', to: 'spa#index'
  resources :entries, defaults: { format: 'json' }

  devise_for :users

  resources :users do
    resources :lists
  end
  resources :lists do
    resources :items
  end

  resources :items


end
