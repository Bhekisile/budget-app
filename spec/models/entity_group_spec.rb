require 'rails_helper'

RSpec.describe 'Entity group', type: :request do
  it 'belongs to entity' do
    association = EntityGroup.reflect_on_association(:entity)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to group' do
    association = EntityGroup.reflect_on_association(:group)
    expect(association.macro).to eq(:belongs_to)
  end
end
