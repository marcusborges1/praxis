Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users

  resources :sectors
  resources :users
  resources :positions
  resources :questions
  resources :evaluations
  resources :evaluation_models
  resources :projects
  resources :answer_groups, only: [:edit, :update, :show]
end
