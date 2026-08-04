Rails.application.routes.draw do
  devise_for :users
  resources :listing
  resources :comment
  resources :booking


  root "listing#index"
end
