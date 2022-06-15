module RubyDo
  module V1
    module Entities
      class Task < Grape::Entity
        expose :id
        expose :list_id
        expose :name
        expose :due_date
        expose :completed, documentation: { type: 'Boolean' }
        expose :created_at, as: :published_at
      end
    end
  end
end
