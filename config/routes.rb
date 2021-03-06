Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'products#index'
  resource :basket, only: [:show]
  resource :charge, only: [:create]
  resources :products, only: [:show] do
    resources :baskets, only: [:create, :destroy]
  end

  namespace :admins do
    root to: "dashboards#index"
    resources :products, only: [:new, :create]
    resource :sales_record, only: [:show]
  end
  
  #mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
