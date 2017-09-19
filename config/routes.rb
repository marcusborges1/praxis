Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users

  resources :evaluations do
    get "/individual_report", to: "evaluations#individual_report", on: :member
  end

  resources :users
  resources :sectors
  resources :projects
  resources :positions
  resources :questions
  resources :evaluation_models
  resources :evaluation_factors
  resources :evaluation_cycles
  resources :projects
  resources :answer_groups, only: [:edit, :update, :show]

  scope :users do
    get "/monitors/:id", to: "users#monitors", as: :monitors
    patch "/add_monitors/:id", to: "users#add_monitors", as: :add_monitors
  end
end
