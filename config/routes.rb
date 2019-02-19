Rails.application.routes.draw do
  root "chats#home"
  get '/about', to: 'chats#about'
  get '/contact', to: 'chats#contact'
  get '/help', to: 'chats#help'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :chats do
    collection do
      post :confirm
    end
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
