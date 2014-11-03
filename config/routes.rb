Rails.application.routes.draw do

  resources :tasks
  resources :users

  root "pages#index"

  get "about" => "pages#about", as: :about
  get "terms" => "pages#terms", as: :terms
  get "FAQ" => "pages#faq", as: :faq

  get '/sign-up' => 'registrations#new', as: :sign_up
  post '/sign-up' => 'registrations#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

end
