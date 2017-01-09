Rails.application.routes.draw do
  # Resources
  resources :grades
  resources :schedules
  resources :subjects
  resources :news
  resources :evaluations, only: [:create, :update, :destroy]

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  resources :users do
    resources :conversations, only: [:create]
  end

  # Devise configuration
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  # Root path for logged in user
  authenticated :user do
    root to: 'users#index'
  end

  # Root path for not logged in user
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
