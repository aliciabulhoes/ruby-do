require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { FactoryBot.create(:task) }

  it 'requires a list' do
    expect { task.update!(list_id: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'deletes the task when a list is deleted' do
    task.list.destroy!
    expect(Task.where(id: task.id).first).to be_nil
  end
end
