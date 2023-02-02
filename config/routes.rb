Rails.application.routes.draw do
  get 'rooms/index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
  resources :rooms do
    resources :messages
  end
  resources :users
  root 'rooms#index'
end
