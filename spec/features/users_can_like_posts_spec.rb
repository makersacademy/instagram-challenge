require 'rails_helper'
require 'web_helpers'
RSpec.feature "Like posts", type: :feature do
    scenario "Can like posts" do
      add_new_user
      click_on('New post')
      fill_in('caption', with: "Test post")
      attach_file("image", Rails.root + "spec/fixtures/gunnersaurus.jpg")
      click_on('Submit')
      expect(page).to have_content("Your image was uploaded successfully!")
      click_on('Sign out')
      add_new_user(email: "testwoman@testing.com", password: "123456")
      click_on('commit')
      expect(page).to have_content("Likes: 1")
    end
  end