# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications,
                     :authorized_applications
  end

  devise_for :users
  # get 'user_lists/index'
  root "dashboard#index"

  get 'dashboard/index', to: "dashboard#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/
  mount RubyDo::Api => '/'

end

