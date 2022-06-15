require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user) }

  it 'requires a first_name' do
    expect { user.update!(first_name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'requires a last_name' do
    expect { user.update!(last_name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'requires a email' do
    expect { user.update!(email: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
