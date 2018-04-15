require 'rails_helper'

RSpec.feature "Show username", type: :feature do
  scenario "Posts show the username" do
    sign_up
    add_post
    click_link "Logout"
    sign_up('name')
    expect(page).not_to have_content("Edit")
    expect(page).not_to have_content("Delete")
  end
end
