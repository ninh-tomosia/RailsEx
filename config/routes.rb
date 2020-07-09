Rails.application.routes.draw do
  
  get     "home"      => "home#index"
  get     "signup"    => "users#new"
  get     "login"     => "sessions#new"
  post    "login"     => "sessions#create"
  delete  "logout"    => "sessions#destroy"
  get     "users"     => "users#index"
  root    "home#index"
  resources :home
  resources :users
  resources :sessions, only: [:new, :create, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
