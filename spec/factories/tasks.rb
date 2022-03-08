FactoryBot.define do
  factory :task do
    association :list, factory: :list
    name { Faker::Name.name }
    due_date { Faker::Date.forward(days: 1) }
    completed { Faker::Boolean.boolean }
  end
end
