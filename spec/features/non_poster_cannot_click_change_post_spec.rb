require 'rails_helper'

RSpec.feature "Cannot click edit/delete", type: :feature do
  scenario "Cannot click edit/delete" do
    sign_up
    add_post
    click_link "Logout"
    sign_up('name')
    expect(page).not_to have_content("Edit")
    expect(page).not_to have_content("Delete")
  end
end
