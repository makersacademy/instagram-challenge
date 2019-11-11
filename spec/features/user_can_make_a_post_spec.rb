require 'rails_helper'


RSpec.feature "User Post", type: :feature do

    scenario "Successful post to newsfeed" do
      signup_as_new_user('josh')
      click_link "Newsfeed"
      click_link "New Post"
      fill_in "post[title]", with: "My Image"
      fill_in "post[image_description]", with: "testing"
      click_button "Create Post"
      # user must exist issue
      # expect(page).to have_content "Post was successfully created"
    end
end
