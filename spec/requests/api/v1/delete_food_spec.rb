require 'rails_helper'

describe 'food API' do
  it 'can delete a food entry' do
    food = create(:food)

    delete "/api/v1/foods/#{food.id}"

    expect(response).to be_success
    expect(response.status).to eq(204)
  end
  it 'returns 404 status if food fails to delete' do
    food = create(:food)

    delete "/api/v1/foods/#{food.id}"

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
end
