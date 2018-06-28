require 'rails_helper'

describe 'meals API' do
  it 'deletes a food from a meal' do
    meal = create(:meal, name: 'Breakfast')
    food = create(:food, name: 'Pumpkin', calories: 800)
    meal.foods << food

    delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    deleted_food_json = JSON.parse(response.body)
    expected_json = {
    "message": "Successfully removed #{food.name} from #{meal.name}"
    }

    expect(meal.foods.count).to eq(0)
    expect(Meal.all.count).to eq(1)
    expect(Food.all.count).to eq(1)
    expect(response).to be_success
    expect(deleted_food_json.to_json).to eq(expected_json.to_json)
  end
  it 'returns 404 status if meal not found' do
    create(:food, name: 'Pumpkin', calories: 800)
    delete "/api/v1/meals/1/foods/1"

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
  it 'returns 404 status if food not found' do
    create(:meal, name: 'Breakfast')
    delete "/api/v1/meals/1/foods/1"

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
end
