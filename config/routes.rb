Rails.application.routes.draw do

  resources :messages
  post "/login", to: "users#login"
  get "/keep_logged_in", to: "users#keep_logged_in"

  resources :chatrooms
  resources :users
  resources :messages, inly: [:create]

  # to instantiate the WebSockets connection wtih a server
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
