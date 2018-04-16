require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature "User posting", type: :feature do

  scenario "can post an image and see it" do
    testImageURL = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Domestic_goat_kid_in_capeweed.jpg"
    sign_up_test_user_1
    click_link "Post a Photo"
    fill_in "post[image_url]", with: testImageURL
    click_button "Post"
    expect(page).to have_css("img[src*='#{testImageURL}']")
  end

  scenario "can post an image and see their name attached to it" do
    testImageURL = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Domestic_goat_kid_in_capeweed.jpg"
    sign_up_test_user_1
    click_link "Post a Photo"
    fill_in "post[image_url]", with: testImageURL
    click_button "Post"
    expect(find("div#post_0")).to have_text('Test User 1')
  end

  scenario "can delete an image they posted" do
    sign_up_test_user_1
    post_goat
    within("div#post_0") do
      click_link "Delete"
    end
    expect(page).not_to have_css("img[src*='#{testImageURL}']")
  end
end
