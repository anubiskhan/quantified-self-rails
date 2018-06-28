require 'rails_helper'

describe 'food API' do
  it 'can create a food entry' do
    new_food = { "food": { "name": "Garlic", "calories": 8} }

    expect(Food.all.count).to eq(0)

    post "/api/v1/foods", params: new_food

    food_json = JSON.parse(response.body)
    expected_json = {
      id: 1,
      name: 'Garlic',
      calories: 8
    }

    expect(response).to be_success
    expect(food_json.to_json).to eq(expected_json.to_json)
    expect(Food.all.count).to eq(1)
  end
  it 'returns 404 status if food fails to create' do
    new_food = { "food": { "name": "Garlic"} }
    post "/api/v1/foods", params: new_food

    expect(response).to_not be_success
    expect(response.status).to eq(400)
  end
end
