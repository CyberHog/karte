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
    resources :notices, only: [:index]
    resources :address
  end
  resources :notices

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
