Rails.application.routes.draw do
  root "chats#home"
  #resources :chats

  resources :chats do
    collection do
      post :confirm
    end
  end

  get '/contact', to: 'chats#contact'
  get '/help', to: 'chats#help'
end
