FactoryBot.define do
  factory :lists do
    association :users, factory: :user
    title { Faker::Name.name }
  end
end
