Rails.application.routes.draw do

  # Standard routes for users and cars
  resources :users do
    resources :cars
  end

  # The index page of Trip Calculator is the Sign Up Page
  root to: "users#new"

  # Redirection of the Sign Up page
  get '/signup' => 'users#new', as: :signup

  # Link to Sign In and Logout pages
  get '/signin' => 'sessions#new', as: :signin
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout



end
