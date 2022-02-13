require 'rails_helper'
require '/Users/bencoyne/Desktop/ig/ig/spec/web_helpers/user_signup.rb'

RSpec.describe "Posts", type: :feature do
  
  context("When a user is signed in") do

    scenario("user can create a post") do
      user_sign_up
      click_link "Post"
      attach_file('Image', "spec/test_image.jpg")
      fill_in 'Caption', with: "#GreatDonut!"
      click_button "Submit"
      expect(page).to have_content("#GreatDonut!")
      expect(page).to have_css("img[src*='test_image.jpg']")
    end

    scenario("post will not be created if no image is uploaded") do
      user_sign_up
      click_link "Post"
      fill_in 'Caption', with: "#GreatDonut!"
      click_button "Submit"
      expect(page).to_not have_content("#GreatDonut!")
      expect(page).to_not have_css("img[src*='test_image.jpg']")
    end

  end
end