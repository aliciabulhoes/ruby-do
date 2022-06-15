require 'doorkeeper/grape/helpers'

module RubyDo
  module V1
    class Users < Grape::API
      helpers Doorkeeper::Grape::Helpers

      before do
        :doorkeeper_authorize!
      end

      resource :users do
        get :me do
          current_user
        end

        params do
          requires :first_name, type: String, allow_blank: false
          requires :last_name, type: String, allow_blank: false
          requires :email, type: String, allow_blank: false, regexp: /.+@.+/
          requires :password, type: String, allow_blank: false
        end
        post :register, protected: false do
          present User.create(params), with: Entities::User
        end
      end
    end
  end
end
