require 'rails_helper'

RSpec.describe 'Entity Index Page', type: :system do
  let(:user) { User.create!(name: 'Joy', email: 'test@example.com', password: 'password', confirmed_at: Time.current) }

  before do
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    login_as user
    puts current_path
  end

  describe 'Group home contents' do
    let(:user1) do
      User.create!(name: 'zena', email: 'test2@example.com', password: 'password', confirmed_at: Time.current)
    end
    let(:group) { Group.create(name: 'example_group', icon: 'example_icon', user_id: user1.id) }
    let(:entity) { Entity.create(name: 'example_entity', amount: 1, group_id: group.id) }

    before(:each) do
      visit new_group_entity_path(group_id: group.id)
    end

    it 'should see the heading' do
      expect(page).to have_content('New Entity')
      expect(page).not_to have_content('You have to confirm your email address before continuing.')
    end
  end
end
