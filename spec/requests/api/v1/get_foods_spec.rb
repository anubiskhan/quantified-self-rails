require 'rails_helper'

describe 'food API' do
  it 'returns JSON of all foods in the db' do
    create(:food)
  end
end
