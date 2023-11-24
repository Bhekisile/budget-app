require 'rails_helper'

RSpec.describe 'User', type: :request do
  let(:user) { User.create(name: 'Joy') }

  it 'has many entities' do
    user = User.reflect_on_association(:entities)
    expect(user.macro).to eq :has_many
  end

  it 'has many groups' do
    user = User.reflect_on_association(:groups)
    expect(user.macro).to eq :has_many
  end

  describe 'Validation' do
    it 'name should be present' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
