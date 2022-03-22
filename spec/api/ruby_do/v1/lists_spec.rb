require 'rails_helper'

describe RubyDo::V1::Lists, type: :request do
  describe 'get /api/v1/lists' do
    subject(:get_path) { get '/api/v1/lists' }
    let!(:lists) { FactoryBot.create_list(:list, 2) }

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

  describe 'get /api/v1/lists/:id' do
    subject(:get_path) { get "/api/v1/lists/#{id}" }
    let!(:list) { FactoryBot.create(:list) }
    context 'invalid params' do
      let(:id) { 1000 }
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

  describe 'post /api/v1/lists' do
    subject(:post_path) { post '/api/v1/lists', params: }

    context 'requires params' do
      let(:params) { {} }
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

  describe 'put /api/v1/lists/:id' do
    subject(:update_path) { put "/api/v1/lists/#{id}", params: }
    let!(:list) { FactoryBot.create(:list) }
    let(:id) { list.id }
    let(:params) do
      {
        title: Faker::Lorem.word
      }
    end

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
