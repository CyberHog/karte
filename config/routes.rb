Rails.application.routes.draw do

  root "users#index"
  get "users/show"

  devise_for :users, :controllers => {
  	:sessions => "users/sessions",
  	:registrations => "users/registrations",
  	:passwords => "users/passwords",
    :mailer => "users/mailer",
    :confirmations => "users/confirmations",
    :unlocks => "users/unlocks"
  }
  
  resources :users do
    collection { get "search" }
    resources :patients
    resources :notices, only: [:index]
    resources :addresses
    resources :receipts
  end
  resources :menus do
    collection { get "search" }
  end
  resources :staffs do
    collection { get "search" }
  end
  resources :patients
  resources :medical_charts do
    resources :staffs
  end
  resources :notices
  resources :receipts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
