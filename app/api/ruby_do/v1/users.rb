require 'doorkeeper/grape/helpers'

module RubyDo
  module V1
    class Users < Grape::API
      helpers Doorkeeper::Grape::Helpers

      before do
        :doorkeeper_authorize!
      end

      # resource :users do
      #   get :me do
      #     current_user
      #   end
      #
      #   post :register, protected: false do
      #   end
      # end
    end
  end
end
