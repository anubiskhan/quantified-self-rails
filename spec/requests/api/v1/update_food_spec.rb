require 'rails_helper'

describe 'food API' do
  it 'can update a food entry' do
    food = create(:food)
    updated_food = { "food": { "name": "Garlic", "calories": 8} }

    patch "/api/v1/foods/#{food.id}", params: update_food

    food_json = JSON.parse(response.body)
    expected_json = {
      id: 1,
      name: 'Garlic',
      calories: 8
    }

    expect(response).to be_success
    expect(food_json.to_json).to eq(expected_json.to_json)
  end
  it 'returns 404 status if food fails to update' do
    food = create(:food)
    update_food = { "food": { "name": "Garlic"} }
    patch "/api/v1/foods/#{food.id}", params: update_food

    expect(response).to_not be_success
    expect(response.status).to eq(400)
  end
end
