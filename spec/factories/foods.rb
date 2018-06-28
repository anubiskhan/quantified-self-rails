FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Name#{n}" }
    calories { rand(1..2000) }
  end
end
