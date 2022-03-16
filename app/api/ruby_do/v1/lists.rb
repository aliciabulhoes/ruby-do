module RubyDo
  module V1
    class Lists < Grape::API
      resource :lists do
        get do
          List.all
        end
      end
    end
  end
end
