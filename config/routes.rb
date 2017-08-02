Rails.application.routes.draw do
  resources :answer_groups, only: [:edit, :update, :show]
  resources :evaluations
  resources :evaluation_models
  root "welcome#index"
  devise_for :users
  resources :sectors
  resources :users
  resources :positions
  resources :questions
  resources :evaluations
  resources :evaluation_models
  resources :projects
end
