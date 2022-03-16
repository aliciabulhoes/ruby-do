require 'rails_helper'

describe RubyDo::V1::Lists, type: :request do
  describe 'get /api/v1/lists' do
    subject(:get_path) { get '/api/v1/lists'}
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
end
