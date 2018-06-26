require 'rails_helper'

describe 'food API' do
  it 'returns formatted json' do
    create(:food)
  end
end
