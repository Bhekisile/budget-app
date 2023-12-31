require 'rails_helper'

RSpec.describe 'Group Home Page', type: :system do
  let(:user) { User.create!(name: 'Joy', email: 'test@example.com', password: 'password', confirmed_at: Time.current) }

  before do
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    login_as user
    puts current_path
  end

  describe 'Group home contents' do
    let(:group) { Group.create(name: 'Nando\'s', icon: 'example_icon', user_id: user.id) }
    before(:each) do
      visit home_groups_path
    end

    it 'should have a hamburger button' do
      expect(page).to have_selector('#menuToggle')
    end
  end
end
