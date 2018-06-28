require 'rails_helper'

describe Food, type: :model do
  context 'validations' do
    it{should validate_presence_of(:name)}
    it{should validate_presence_of(:calories)}
  end
end
