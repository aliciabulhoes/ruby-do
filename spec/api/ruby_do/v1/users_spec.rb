require 'rails_helper'

describe RubyDo::V1::Users, type: :request do
  describe 'get /api/v1/users/me' do
    subject(:get_path) { get '/api/v1/users/me', headers: { 'Authorization': "Bearer #{token}" } }
    let!(:user) { FactoryBot.create(:user) }

    context 'unauthorized' do
      let(:token) { nil }

      it 'fails with HTTP 401' do
        get_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'authorized' do
      let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id).token }

      it 'returns success' do
        get_path
        expect(response).to be_successful
      end

      it 'gets user information' do
        get_path
        expect(response.body).to include_json(
          []
        )
      end
    end
  end

  describe 'post /api/v1/users/register' do
    subject(:register_user) { post '/api/v1/users/register', params: }

    let(:params) do
      {
        first_name: Faker::Name.name,
        last_name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }
    end

    it 'returns success' do
      register_user
      expect(response).to have_http_status(:created)
    end

    it 'returns new user' do
      register_user
      expect(response.body).to include_json(
        first_name: 'John',
        last_name: 'Johnson',
        email: 'john@johnson.com'
      )
    end
  end
end
