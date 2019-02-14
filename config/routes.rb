Rails.application.routes.draw do
  root "chats#home"
  resources :chats do
    collection do
      post :confirm
    end
  end

  get '/contact', to: 'chats#contact'
  get '/help', to: 'chats#help'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
