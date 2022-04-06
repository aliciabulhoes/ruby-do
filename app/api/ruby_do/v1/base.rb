module RubyDo
  module V1
    class Base < Grape::API
      version 'v1', using: :path

      mount Lists
      mount Tasks
    end
  end
end
