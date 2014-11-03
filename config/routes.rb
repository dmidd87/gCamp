Rails.application.routes.draw do

  resources :tasks
  resources :users

  root "pages#index"

  get "about" => "pages#about", as: :about
  get "terms" => "pages#terms", as: :terms
  get "FAQ" => "pages#faq", as: :faq
  get "signup" => "signup#index", as: :signup


end
