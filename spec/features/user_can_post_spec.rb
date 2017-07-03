require 'rails_helper'

RSpec.feature "New posts", type: :feature do
  scenario "Can submit posts and view them" do
    sign_in
    click_on "Add new"
    fill_in "Title", with: "Hello, world!"
    click_button "Upload"
    expect(page).to have_content("Hello, world!")
  end
end
