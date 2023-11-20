require 'rails_helper'

RSpec.describe 'Entity group', type: :request do
  it 'has many entity' do
    association = EntityGroup.reflect_on_association(:entity)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many group' do
    association = EntityGroup.reflect_on_association(:group)
    expect(association.macro).to eq(:has_many)
  end
end
