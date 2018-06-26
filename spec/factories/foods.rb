FactoryBot.define do
  factory :food do
    name Faker::Food.dish
    calories rand(1..2000)
  end
end
