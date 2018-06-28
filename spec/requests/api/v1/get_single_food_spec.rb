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
    expect(food_json.to_json).to eq(expected_json.to_json)
  end
  it 'returns 404 status if food not found' do
    get "/api/v1/foods/1"

    food_json = JSON.parse(response.body)

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
end
