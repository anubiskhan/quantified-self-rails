require 'rails_helper'

describe Food, type: :model do
  context 'validations' do
    it{should validate_presence_of(:name)}
    it{should validate_presence_of(:calories)}
  end
  context 'relationships' do
    it{should have_many(:meal_foods)}
    it{should have_many(:meals)}
  end
end
