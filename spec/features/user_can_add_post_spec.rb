require 'rails_helper'

RSpec.feature "Posting image", type: :feature do
  scenario "User signs in and is able to click button add post" do
    visit '/'
    click_link "Sign up"
    expect(page).to have_content("Add post")
  end
end