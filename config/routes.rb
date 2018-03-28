Rails.application.routes.draw do
  root "homes#index"
  get "homes/show"

  devise_for :users, :controllers => {
  	:sessions => "users/sessions",
  	:registrations => "users/registrations",
  	:passwords => "users/passwords"
  }
  resources :users, :only => [:index, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
