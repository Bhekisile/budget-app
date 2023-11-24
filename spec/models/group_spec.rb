require 'rails_helper'

RSpec.describe 'Group', type: :request do
  let(:user) { User.create(name: 'Joy') }

  it 'belongs to user' do
    group = Group.new(name: nil, icon: 'example_icon', user_id: user.id)
    expect(group).not_to be_valid
  end

  it 'has many entity groups' do
    association = Group.reflect_on_association(:entity_groups)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
  end

  it 'belongs to a user' do
    association = Group.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'validates presence of icon' do
    group = Group.new(name: 'Example Group', icon: nil, user_id: user.id)
    expect(group).not_to be_valid
  end
end
