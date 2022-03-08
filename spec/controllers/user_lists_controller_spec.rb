require 'rspec'

RSpec.describe "UserLists", type: :controller do
  describe 'UserListsController' do
    subject(:userList) { get "users/#{user.id}/lists" }
    subject(:user) { FactoryBot.create(:user) }
    subject(:list) { FactoryBot.create(:list, user: user) }

    it 'return users list' do
      userList
      expect(response).to have_http_status(:ok)
    end
  end
end
