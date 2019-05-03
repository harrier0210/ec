Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:new, :create, :show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
