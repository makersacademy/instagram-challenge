require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature "Commenting on posts", type: :feature do

  scenario "can comment on a photo" do
    sign_up_test_user_1
    post_goat
    within("div#post_0") do
      click_link "Comments"
      fill_in "comment[body]", with: "Test Comment"
      click_button "Leave Comment"
    end
    expect(find("div#comment_0_0")).to have_text("Test Comment")
  end
end
