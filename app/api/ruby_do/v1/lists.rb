module RubyDo
  module V1
    class Lists < Grape::API
      resource :lists do
        desc 'Return all lists'
        get do
          List.all
        end

        desc 'Return a specific list.'
        params do
          requires :id, type: Integer, desc: 'List ID.'
        end
        route_param :id do
          get do
            List.find(params[:id])
          end
        end
      end
    end
  end
end
