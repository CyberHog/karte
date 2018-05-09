Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
  	:sessions => "users/sessions",
  	:registrations => "users/registrations",
  	:passwords => "users/passwords",
    :mailer => "users/mailer",
    :confirmations => "users/confirmations",
    :unlocks => "users/unlocks"
  }

    root "users#index"
    get "users/:id", to: "users#show"
    get "users/edit"
    get "users/followers/:user_id", to: "users#followers", as: "users_followers"
    get "users/following/:user_id",to: "users#following", as: "users_following"
    put 'users/follow/:user_id' => 'users#follow'
    put 'users/unfollow/:user_id' => 'users#unfollow'

  resources :users do
    collection { get "search" }
    resources :clinics
    resources :patients
    resources :notices, only: [:index]
    resources :addresses
    resources :receipts
    resources :follows
  end
  resources :clinics do
    resources :clinic_cards
    resources :menus
    resources :staffs
  end
  resources :patients do
    resources :clinic_cards
  end
  resources :clinic_cards do
    resources :patients_receipts
  end
  resources :patients_receipts do
    resources :receipts
    resources :menus
  end
  resources :receipts do
    resources :menus
  end
  resources :menus do
    collection { get "search" }
  end
  resources :staffs do
    collection { get "search" }
  end
  resources :medical_charts do
    resources :staffs
  end
  resources :notices
  resources :receipts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
