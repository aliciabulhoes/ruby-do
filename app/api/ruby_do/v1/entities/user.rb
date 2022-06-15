module RubyDo
  module V1
    module Entities
      class User < Grape::Entity
        expose :id
        expose :first_name
        expose :last_name
        expose :email
      end
    end
  end
end