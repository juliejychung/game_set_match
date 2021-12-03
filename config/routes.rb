Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "users#index"
  resources :courts
  resources :lessons
  resources :comments
  resources :matches
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
