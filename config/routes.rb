Rails.application.routes.draw do
  resources :positions
  root "welcome#index"
end
