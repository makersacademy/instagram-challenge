require 'rails_helper'

RSpec.feature "Makes a post", type: :feature do
  scenario "User can make a post" do

    visit "/"
    click_link "New post"
    fill_in "Message", with: "Hello there!"
    click_button "Create Post"
    expect(page).to have_content("Hello there!")
    click_on 'Back'
    click_link "New post"
    fill_in "Message", with: "Hi again"
    click_button "Create Post"
    click_on 'Back'
    expect(page).to have_content("Hello there!")
    expect(page).to have_content("Hi again")
  end
end
