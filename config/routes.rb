Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users

  resources :results

  resources :races, only: [:new, :create]
end
