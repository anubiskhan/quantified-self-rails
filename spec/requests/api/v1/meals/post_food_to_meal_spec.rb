require 'rails_helper'

describe 'meals API' do
  it 'adds a food to a meal via association' do
    meal = create(:meal, name: 'Breakfast')
    food = create(:food, name: 'Pumpkin', calories: 800)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    added_food_json = JSON.parse(response.body)
    expected_json = {
    "message": "Successfully added #{food.name} to #{meal.name}"
    }
    expect(meal.foods.count).to eq(1)
    expect(response).to be_success
    expect(added_food_json.to_json).to eq(expected_json.to_json)
  end
  it 'returns 404 status if meal not found' do
    create(:food, name: 'Pumpkin', calories: 800)
    post "/api/v1/meals/1/foods/1"

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
  it 'returns 404 status if food not found' do
    create(:meal, name: 'Breakfast')
    post "/api/v1/meals/1/foods/1"

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
end
