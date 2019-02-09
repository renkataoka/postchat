Rails.application.routes.draw do
  root "chats#index"
  #resources :chats

  resources :chats do
    collection do
      post :confirm
      get :contact
    end
  end

end
