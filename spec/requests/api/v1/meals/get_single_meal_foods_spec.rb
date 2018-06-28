require 'rails_helper'

describe 'meals API' do
  it 'returns JSON of a single meal and associated food(s)' do
    meal = create(:meal, name: 'Breakfast')
    meal.foods.create(name: 'Pumpkin', calories: 800)

    get "/api/v1/meals/#{meal.id}/foods"

    meal_json = JSON.parse(response.body)
    expected_json = {
      id: meal.id,
      name: 'Breakfast',
      foods: {
        id: 1,
        name: 'Pumpkin',
        calories: 800
      }
    }

    expect(response).to be_success
    expect(meal_json.to_json).to eq(expected_json.to_json)
  end
  it 'returns 404 status if food not found' do
    get "/api/v1/meals/1/foods"

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
end
