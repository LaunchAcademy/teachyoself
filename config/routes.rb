TeachYoSelf::Application.routes.draw do
  devise_for :users
  resources :posts, only: [:index]
  root to: "posts#index"
  end
