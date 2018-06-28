require 'rails_helper'

describe Meal, type: :model do
  context 'validations' do
    it{should validate_presence_of(:name)}
  end
end
