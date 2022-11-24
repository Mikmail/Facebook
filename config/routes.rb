Rails.application.routes.draw do
  devise_for :users

  resources :posts

  root "posts#index"

  get '/notifications/index', to: 'notifications#index', as: "notifications"
  get '/users/:id', to:'users#show', as: "user"

  post "users/:id/follow", to: "users#follow", as: "follow"
  post "users/:id/unfollow", to: "users#unfollow", as: "unfollow"
  post "users/:id/accept", to: "users#accept", as: "accept"
  post "users/:id/decline", to: "users#decline", as: "decline"
  post "users/:id/cancel", to: "users#cancel", as: "cancel"

  
end
