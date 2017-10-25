Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users

  resources :evaluations do
    get "/individual_report/:user_id/:evaluation_target_id", to: "evaluations#individual_report", on: :member, as: :individual_report
    get "/answer_groups/:answer_group_id/users/:user_id", to: "evaluations#answer_groups", on: :member, as: :answer_group_user
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

  get '/unanswered', to: "answer_groups#unanswered"

  scope :users do
    get "/monitors/:id", to: "users#monitors", as: :monitors
    patch "/add_monitors/:id", to: "users#add_monitors", as: :add_monitors
  end
end
