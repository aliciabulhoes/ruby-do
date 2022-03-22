require 'rails_helper'

RSpec.describe List, type: :model do
  subject(:list) { FactoryBot.create(:list) }

  it 'requires a user' do
    expect { list.update!(user_id: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'deletes the list when a user is deleted' do
    list.user.destroy!
    expect(List.where(id: list.id).first).to be_nil
  end

  it 'requires a title' do
    expect { list.update!(title: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
