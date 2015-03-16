Rails.application.routes.draw do
  resources :categories do
    resources :ideas
  end

  root "categories#index"

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, controller: 'clearance/users', only: [:create] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  get "upvote/:id", to: "ideas#upvote", as: "upvote"

  get "categories/:id/pending", to: "categories#pending", as: "pending"
  get "categories/:id/complete", to: "categories#complete", as: "complete"
end
