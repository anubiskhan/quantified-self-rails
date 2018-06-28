require 'rails_helper'

describe 'food API' do
  it 'returns JSON of a single food' do
    food = create(:food, name: 'Pumpkin', calories: 800)

    get "/api/v1/foods/#{food.id}"

    food_json = JSON.parse(response.body)
    expected_json = {
      id: food.id,
      name: 'Pumpkin',
      calories: 800
    }
    expect(response).to be_success
    expect(food_json).to eq(expected_json)
  end
end
