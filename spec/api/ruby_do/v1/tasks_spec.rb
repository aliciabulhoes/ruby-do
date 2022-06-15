require 'rails_helper'

describe RubyDo::V1::Tasks, type: :request do
  describe 'post /api/v1/tasks' do
    subject(:post_path) { post '/api/v1/tasks', headers: { 'Authorization': "Bearer #{token}" }, params: }
    let(:user) { FactoryBot.create(:user) }
    let(:params) { {} }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        post_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'authorized' do
      let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id).token }

      context 'requires params' do
        it 'raises error' do
          post_path
          expect(response).to have_http_status(:bad_request)
        end

        it 'title cannot be blank' do
          params[:name] = ''
          post_path
          expect(response).to have_http_status(:bad_request)
        end

        it 'valid list id' do
          params[:list_id] = ''
          post_path
          expect(response).to have_http_status(:bad_request)
        end
      end

      context 'valid' do
        let!(:list) { FactoryBot.create(:list) }
        let(:params) { { list_id: list.id, name: Faker::Lorem.word } }
        it 'creates a task' do
          post_path
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'put /api/v1/tasks/id' do
    subject(:put_call) { put "/api/v1/tasks/#{task.id}", headers: { 'Authorization': "Bearer #{token}" }, params: }
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id).token }
    let!(:task) { FactoryBot.create(:task) }
    let(:params) do
      {
        name: Faker::Lorem.word
      }
    end

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        put_call
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'authorized' do
      it 'name cannot be blank' do
        params[:name] = ''
        put_call
        expect(response).to have_http_status(:bad_request)
      end

      it 'updates task name' do
        put_call
        expect(response.body).to include_json({ name: params[:name] })
      end
    end
  end

  describe 'delete /api/v1/tasks/id' do
    subject(:delete_path) do
      delete "/api/v1/tasks/#{task.id}", headers: { 'Authorization': "Bearer #{token}" }
    end
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id).token }
    let!(:task) { FactoryBot.create(:task) }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        delete_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'authorized' do
      it 'deletes a task' do
        delete_path
        expect(Task.where(id: task.id).first).to be_nil
      end
    end
  end
end
