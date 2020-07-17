Rails.application.routes.draw do

  get "/admin", to: "admin/dashboard#index"

  root "guest/home#index"

  scope module: "admin", path: "admin" do
    get "dashboard", to: "dashboard#index"
    get "posts", to: "posts#index"
    get "add-post", to: "posts#new"
    post "posts", to: "posts#create"
    get "edit-post", to: "posts#edit"
    put "posts", to: "posts#update"
    delete "posts", to: "posts#destroy"
    get "show-post", to: "posts#show"
    resources :dashboard, only: [:index]
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
    resources :posts
    resources :comments
    resources :sessions, only: [:new, :create, :destory]
  end
  # Ex:- scope :active, -> {where(:active => true)}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
