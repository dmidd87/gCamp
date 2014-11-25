Rails.application.routes.draw do

  root "pages#index"

  resources :comments

  resources :projects do
    resources :tasks
    resources :memberships
end
  resources :users

  get "about" => "pages#about", as: :about
  get "terms" => "pages#terms", as: :terms
  get "FAQ" => "pages#faq", as: :faq

  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'

  get '/sign-in' => 'authentications#new', as: :signin
  post '/sign-in' => 'authentications#create'

  get '/sign-out' => 'authentications#destroy', as: :signout

end
