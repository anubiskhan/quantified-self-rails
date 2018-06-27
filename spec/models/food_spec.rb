require 'rails_helper'

describe Food do
  context 'attributes' do
    it{should validate_presence_of(:name)}
    it{should validate_presence_of(:calories)}
  end
end
