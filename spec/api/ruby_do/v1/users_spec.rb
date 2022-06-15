require 'rails_helper'

describe RubyDo::V1::Users, type: :request do
  describe 'get /api/v1/users/me' do
    subject(:get_path) { get '/api/v1/users/me', headers: { 'Authorization': "Bearer #{token}" } }
    let!(:user) { FactoryBot.create(:user) }
    let(:token) { nil }

    context 'unauthorized' do
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

    context 'invalid params' do
      it 'returns error when params are blank' do
        params[:first_name] = nil
        register_user
        expect(response).to have_http_status(400)
      end

      it 'returns error when email is invalid' do
        params[:email] = 'email.com'
        register_user
        expect(response).to have_http_status(400)
      end
    end

    context 'valid params' do
      it 'returns success' do
        register_user
        expect(response).to have_http_status(:created)
      end

      it 'returns new user' do
        register_user
        expect(response.body).to include_json(
                                   first_name: params[:first_name],
                                   last_name: params[:last_name],
                                   email: params[:email]
                                 )
      end
    end
  end
end
