require 'rails_helper'

describe RubyDo::V1::Lists, type: :request do
  describe 'get /api/v1/lists' do
    subject(:get_path) { get '/api/v1/lists', headers: { 'Authorization': "Bearer #{token}" } }
    let(:user) { FactoryBot.create(:user) }
    let!(:lists) { FactoryBot.create_list(:list, 2, user:) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id).token }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        get_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'authorized' do
      it 'returns success' do
        get_path
        expect(response).to be_successful
      end

      it 'gets all lists' do
        get_path
        expect(response.body).to include_json(
                                   [
                                     { id: lists[0].id, title: lists[0].title },
                                     { id: lists[1].id, title: lists[1].title }
                                   ]
                                 )
      end

      context 'list with tasks' do
        let!(:task) { FactoryBot.create(:task, list: lists[0]) }

        it 'gets all lists with tasks' do
          get_path
          expect(response.body).to include_json(
                                     [
                                       {
                                         id: lists[0].id,
                                         title: lists[0].title,
                                         tasks: [
                                           {
                                             name: task.name,
                                             list_id: lists[0].id,
                                             published_at: task.created_at.as_json
                                           }
                                         ]
                                       }
                                     ]
                                   )
        end
      end
    end
  end

  describe 'get /api/v1/lists/:id' do
    subject(:get_path) { get "/api/v1/lists/#{id}", headers: { 'Authorization': "Bearer #{token}" } }
    let(:list) { FactoryBot.create(:list) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: list.user.id).token }
    let(:id) { 1000 }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        get_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'authorized' do
      context 'invalid params' do
        it 'raises error' do
          expect { get_path }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      context 'valid params' do
        let(:id) { list.id }
        it 'returns success' do
          get_path
          expect(response.body).to include_json({ id: list.id, title: list.title, tasks: [] })
        end
      end
    end
  end

  describe 'post /api/v1/lists' do
    subject(:post_path) { post '/api/v1/lists', params:, headers: { 'Authorization': "Bearer #{token}" } }
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id).token }
    let(:params) { {} }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        post_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'authorized' do
      context 'requires params' do
        it 'raises error' do
          post_path
          expect(response).to have_http_status(:bad_request)
        end

        it 'title cannot be blank' do
          params[:title] = ''
          post_path
          expect(response).to have_http_status(:bad_request)
        end
      end

      context 'valid params' do
        let(:params) { { title: 'The Title' } }

        it 'returns success' do
          post_path
          expect(response.body).to include_json({ title: 'The Title' })
        end
      end
    end
  end

  describe 'put /api/v1/lists/:id' do
    subject(:update_path) { put "/api/v1/lists/#{id}", params:, headers: { 'Authorization': "Bearer #{token}" } }
    let(:list) { FactoryBot.create(:list) }
    let(:id) { list.id }
    let(:params) do
      {
        title: Faker::Lorem.word
      }
    end
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: list.user.id).token }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        update_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'authorized' do
      it 'title cannot be blank' do
        params[:title] = ''
        update_path
        expect(response).to have_http_status(:bad_request)
      end

      it 'updates list title' do
        update_path
        expect(response.body).to include_json({ title: params[:title] })
      end
    end
  end

  describe 'delete /api/v1/lists/:id' do
    subject(:delete_path) { delete "/api/v1/lists/#{list.id}", headers: { 'Authorization': "Bearer #{token}" } }
    let(:list) { FactoryBot.create(:list) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: list.user.id).token }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        delete_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'authorized' do
      it 'deletes a list' do
        delete_path
        expect(List.where(id: list.id).first).to be_nil
      end
    end
  end
end
