require 'rails_helper'

RSpec.describe 'Group', type: :request do
  let(:user) { User.create(name: 'Joy') }

  it 'belongs to an author' do
    association = Entity.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
    expect(association.class_name).to eq('User')
  end

  it 'has many groups through entity groups' do
    association = Entity.reflect_on_association(:groups)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:entity_groups)
  end

  it 'has many entity groups' do
    association = Entity.reflect_on_association(:entity_groups)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
  end

  it 'validates presence of name' do
    entity = Entity.new(author_id: user.id, name: nil, amount: 1)
    expect(entity).not_to be_valid
  end

  it 'validates presence and numericality of amount' do
    entity = Entity.new(name: 'Example', amount: -1)
    expect(entity).not_to be_valid
  end
end
