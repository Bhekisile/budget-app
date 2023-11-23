require 'rails_helper'

RSpec.describe 'Group Home Page', type: :system do
  let(:user) { User.create!(name: 'Joy', email: 'test@example.com', password: 'password', confirmed_at: Time.current) }

  before do
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    login_as user
    puts current_path
  end

  describe 'Group home contents' do
    before(:each) do
      visit home_groups_path
    end

    it 'should see the heading' do
      expect(page).to have_content('Groups')
      expect(page).not_to have_content('You have to confirm your email address before continuing.')
    end

    it 'should have a hamburger button' do
      expect(page).to have_selector('#menuToggle')
    end
  end
end
