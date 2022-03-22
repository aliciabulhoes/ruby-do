module RubyDo
  module V1
    class Lists < Grape::API
      resource :lists do
        desc 'Return all lists' do
          entity Entities::List
        end
        get do
          lists = List.all
          present lists, with: Entities::List
        end

        desc 'Return a specific list.' do
          entity Entities::List
        end
        params do
          requires :id, type: Integer, desc: 'List ID.'
        end
        route_param :id do
          get do
            list = List.find(params[:id])
            present list, with: Entities::List
          end
        end

        desc 'Create a list.'
        params do
          requires :title, type: String, desc: 'List Title.', allow_blank: false
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
