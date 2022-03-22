module RubyDo
  module V1
    module Entities
      class List < Grape::Entity
        expose :id
        expose :title
        expose :tasks, using: Task
      end
    end
  end
end
