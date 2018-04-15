require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature "User posting", type: :feature do

  scenario "can post an image and see it" do
    testImageURL = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Domestic_goat_kid_in_capeweed.jpg"
    sign_up_test_user
    click_link "Post a Photo"
    fill_in "post[image_url]", with: testImageURL
    click_button "Post"
    expect(page).to have_css("img[src*='#{testImageURL}']")
  end
  xscenario "can post an image and see their name attached to it" do
    testImageURL = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Domestic_goat_kid_in_capeweed.jpg"
    sign_up_test_user
    click_link "Post a Photo"
    fill_in "post[image_url]", with: testImageURL
    click_button "Post"
    within('div#post_1') do
      should have_content 'Posted by Test User'
    end
  end
end
