require 'rails_helper'
require 'web_helpers'
RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    add_new_user
    expect(page).to have_content("test@testing.com")
  end
end
