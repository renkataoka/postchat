Rails.application.routes.draw do
  root "chats#index"
  resources :chats

  resources :chats do
    collection do
      post :confirm
    end
  end
end
