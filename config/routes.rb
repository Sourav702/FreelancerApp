Rails.application.routes.draw do
  resources :users do
    member do
      get :confirm_email
    end
  end
  get "signup", to: "users#new", as: "signup"
  get "profile", to: "users#profile",as:"profile"
  post "/users" => "users#create"
  resources :sessions, only: [:new, :create, :destroy]
  root 'home#index'
  get "login", to: "sessions#new", as: "login"

  get "logout", to: "sessions#destroy", as: "logout"

  resources :jobs
  get "new_jobs", to: "jobs#new", as: "new_jobs"
  get "mypost", to: "jobs#mypost", as: "mypost"
  resources :freelancers do
    member do
      get :confirm_email
    end
  end
  get "freelancer-signup", to: "freelancers#new", as: "freelancer-signup"
  post "/freelancers" => "freelancers#create"
  resources :freesessions, only: [:new, :create, :destroy]
  get "freelancer-login", to: "freesessions#new", as: "freelancer-login"

  get "freelancerlogout", to: "freesessions#destroy", as: "freelancer-logout"


  resources :adminsessions, only: [:new, :create, :destroy]
  get "admin-login", to: "adminsessions#new", as: "admin-login"

  get "adminlogout", to: "adminsessions#destroy", as: "admin-logout"

end
