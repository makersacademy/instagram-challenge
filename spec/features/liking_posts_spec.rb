require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature "User posting", type: :feature do

  scenario "can like another users photo" do
    sign_up_test_user_1
    post_goat
    expect(find("div#post_0")).to have_text("0 \u2665")
    click_link "Log Out"
    sign_in_test_user_2
    within("div#post_0") do
      click_button "Like"
    end
    expect(find("div#post_0")).to have_text("1 \u2665")
  end
end
