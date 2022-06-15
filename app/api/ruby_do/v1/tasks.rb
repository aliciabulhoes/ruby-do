module RubyDo
  module V1
    class Tasks < Grape::API
      helpers Doorkeeper::Grape::Helpers

      before do
        doorkeeper_authorize!
      end

      resource :tasks do
        desc 'Create a task.'
        params do
          requires :name, type: String, desc: 'Task name.', allow_blank: false
          requires :list_id, type: Integer, desc: 'List associated.', allow_blank: false
        end
        post do
          Task.create(params)
        end

        desc 'Update a task.'
        params do
          requires :name, type: String, desc: 'Task name.', allow_blank: false
        end
        route_param :id do
          put do
            Task.update(params[:id], params)
          end
        end

        desc 'Delete a task.'
        route_param :id do
          delete do
            Task.delete(params[:id])
          end
        end
      end
    end
  end
end
