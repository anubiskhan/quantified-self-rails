require 'rails_helper'

describe 'meals API' do
  it 'returns JSON of all meals in the db' do
    create_list(:meal, 2)

    get '/api/v1/meals'

    meals = JSON.parse(response.body)

    expect(response).to be_success
    expect(meals.count).to eq(2)
  end
end
