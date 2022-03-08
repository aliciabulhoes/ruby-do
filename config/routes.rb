# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'user_lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    resources :lists, only: [:index]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

