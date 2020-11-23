require 'rails_helper'
require 'web_helpers'
RSpec.feature "Sign out", type: :feature do
  scenario "Can sign out" do
    add_new_user
    expect(page).to have_content("test@testing.com")
    click_on('Sign out')
    expect(page).to have_content("Welcome, stranger")
  end
end