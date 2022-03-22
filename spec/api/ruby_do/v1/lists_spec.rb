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
      # with one list ie. let!(:list) { FactoryBot.create(:list) }
      # expect(JSON.parse(response.body)[0]).to eq(JSON.parse(lists.to_json))
      expect(JSON.parse(response.body)).to eq(JSON.parse(lists.to_json))
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
        expect(JSON.parse(response.body)).to eq(JSON.parse(list.to_json))
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
        expect(JSON.parse(response.body)['title']).to eq('The Title')
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
      expect(JSON.parse(response.body)['title']).to eq(params[:title])
    end
  end
end
