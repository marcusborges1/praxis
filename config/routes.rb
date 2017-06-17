Rails.application.routes.draw do
  resources :positions
  root "welcome#index"
  resources :users
  resources :sectors
end
