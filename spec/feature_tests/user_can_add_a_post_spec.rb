require 'rails_helper'

RSpec.describe "Add post", :type => :feature do
  feature 'Add post' do
    scenario "User adds a post and post is displayed" do
      visit '/'
      click_on 'New Post'
      fill_in 'post[comment]', with: 'New Post'
      click_button 'Add Post!'
      expect(page).to have_content('New Post')
    end
  end
end
