module RubyDo
  class Api < Grape::API
    format :json
    prefix :api

    helpers do
      def current_user
        user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
        if user
          @current_user = user
        else
          false
        end
      end
    end

    mount RubyDo::V1::Base
  end
end
