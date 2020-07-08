Rails.application.routes.draw do

  get "home", to: "home#index"
  resources :home
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
