Rails.application.routes.draw do
  get 'charge/create'
  devise_for :users
  root 'products#index'
  resource :basket, only: [:show]
  resource :charge, only: [:create]
  resources :products, only: [:new, :create, :show] do
    resources :baskets, only: [:create, :destroy]
  end
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
