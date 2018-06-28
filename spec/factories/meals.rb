FactoryBot.define do
  factory :meal do
    sequence(:name) { |n| "Name#{n}" }
  end
end
