require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "Nata11"
    fill_in "Password", with: "Password11"
    fill_in "Password confirmation", with: "Password11"
    click_button "Sign Up"
    click_link "New post"
    fill_in "Title", with: "Hello, world!"
    click_button "Post"
    expect(page).to have_content("Hello, world!")
  end
end