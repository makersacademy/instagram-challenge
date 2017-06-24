require 'rails_helper'
require 'web_helpers'

RSpec.feature "Sessions", type: :feature do
  scenario "User can sign out", :type => :feature do
    sign_up
    click_on("Log Out")
    expect(page).to have_content "Signed out successfully."
  end
end
