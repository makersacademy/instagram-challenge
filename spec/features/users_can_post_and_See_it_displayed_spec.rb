require 'rails_helper'
require 'web_helpers'
RSpec.feature "Sign in", type: :feature do
  scenario "Can sign in" do
    add_new_user
    expect(page).to have_content("test@testing.com")
    click_on('New post')
    expect(page).to have_content("Caption")
    fill_in('Caption', with: "Test post")
    click_on('Submit')
    expect(page).to have_content("Test post")
  end
end