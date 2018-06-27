require 'rails_helper'

describe 'food API' do
  it 'returns JSON of all foods in the db' do
    create_list(:food, 2)

    get '/api/v1/foods'

    foods = JSON.parse(response.body)

    expect(response).to be_success
    expect(foods.count).to eq(2)
  end
end
