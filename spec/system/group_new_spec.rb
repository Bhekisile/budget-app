require 'rails_helper'

RSpec.describe 'Group New Page', type: :system do
  let(:user) { User.create!(name: 'Joy', email: 'test@example.com', password: 'password', confirmed_at: Time.current) }

  before do
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    login_as user
    puts current_path
  end

  describe 'Group new contents' do
    Group.new(name: 'example_group', icon: 'example_icon', user_id: user.id)
    before(:each) do
      visit new_group_path
    end

    it 'should see the heading' do
      expect(page).to have_content('New Group')
      expect(page).not_to have_content('You have to confirm your email address before continuing.')
    end

    # it "Should see the form content." do
    #   expect(page).to have_content('Enter New Group')
    # end
  end
end
