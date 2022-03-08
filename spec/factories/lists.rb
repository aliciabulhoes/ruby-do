FactoryBot.define do
  factory :list do
    association :user, factory: :user
    title { Faker::Name.name }
  end
end
