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

        desc 'Create a list.'
        params do
          requires :title, type: String, desc: 'List Title.'
        end
        post do
          List.create(params)
        end

        desc 'Update a list.'
        params do
          requires :title, type: String, desc: 'List Title.', allow_blank: false
        end
        route_param :id do
          put do
            List.update(params[:id], params)
          end
        end
      end
    end
  end
end
