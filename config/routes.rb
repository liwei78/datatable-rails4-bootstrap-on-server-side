Rails.application.routes.draw do

  resources :skills

  resources :workers do
    collection do
      post "search"
    end
  end

  # Authentication
  devise_for :users

  # General

  # Root
  root 'workers#index'
end
