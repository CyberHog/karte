Rails.application.routes.draw do

  devise_for :users, :controllers => {
  	:sessions => "users/sessions",
  	:registrations => "users/registrations",
  	:passwords => "users/passwords",
    :mailer => "users/mailer",
    :confirmations => "users/confirmations",
    :unlocks => "users/unlocks"
  }

  root "users#index"
  get "users/search"
  get "users/:id", to: "users#show"
  get "users/edit"
  get "users/followers/:user_id", to: "users#followers", as: "users_followers"
  get "users/following/:user_id",to: "users#following", as: "users_following"
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'

  resources :users do
    collection { get "search" }
    resource :clinic, only: [:index, :show] do
      collection { get "search" }
    end
    resources :medical_charts, only: [:index, :show]
    resources :menus, only: [:index, :show] do
      collection { get "search" }
    end
    resources :staffs, only: [:index] do
      collection { get "search" }
    end
    resources :coupons, only: [:index, :show] do
      collection { get "search"}
    end
    resources :notices, only: [:index]
    resources :addresses
    resources :clinic_cards, only: [:index, :show]
    resources :patients_receipts, only: [:index, :show] do
      collection { get "search" }
      resources :receipts
    end
    resources :follows
  end

  resources :clinics do
    collection { get "search" }
  end

  resources :patients_receipts do
    resources :receipts
    resources :menus
  end

  resources :menus do
    collection { get "search" }
  end
  resources :medical_charts
  resources :notices

  namespace :practice do
    root "users#index"
    get "users/search"
    get "users/:id", to: "users#show"
    get "users/edit"
    get "users/followers/:user_id", to: "users#followers", as: "users_followers"
    get "users/following/:user_id",to: "users#following", as: "users_following"
    put 'users/follow/:user_id' => 'users#follow'
    put 'users/unfollow/:user_id' => 'users#unfollow'

    resources :users do
      collection { get "search" }
      resource :clinic do
        collection { get "search" }
      end
      resources :medical_charts
      resources :menus do
        collection { get "search" }
      end
      resources :staffs do
        collection { get "search" }
      end
      resources :coupons do
        collection { get "search"}
      end
      resources :notices, only: [:index]
      resources :addresses
      resources :clinic_cards
      resources :patients_receipts do
        collection { get "search" }
        resources :receipts
      end
      resources :follows
    end

    resources :clinics do
      collection { get "search" }
    end

    resources :patients_receipts do
      resources :receipts
      resources :menus
    end

    resources :menus do
      collection { get "search" }
    end
    resources :medical_charts
    resources :notices
  end


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
