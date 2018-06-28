FactoryBot.define do
  factory :meal do
    sequence(:name) { |n| "Name#{n}" }
    food
  end
end
