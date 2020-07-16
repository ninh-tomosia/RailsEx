Rails.application.routes.draw do

  get "/admin", to: "admin/dashboard#index"

  root "guest/home#index"

  scope module: "admin", path: "admin" do
    get "dashboard", to: "dashboard#index"
    resources :dashboard, only: [:index]
    resources :posts
  end

  scope module: "guest" do
    get     "home"      => "home#index"
    get     "signup"    => "users#new"
    get     "login"     => "sessions#new"
    post    "login"     => "sessions#create"
    delete  "logout"    => "sessions#destroy"
    get     "users"     => "users#index"
    resources :home
    resources :users
    resources :sessions, only: [:new, :create, :destory]
  end
  # Ex:- scope :active, -> {where(:active => true)}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
