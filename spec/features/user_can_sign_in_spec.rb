require 'rails_helper'
require 'web_helpers'

RSpec.feature "Sessions", type: :feature do
  scenario "User can sign in", :type => :feature do
    sign_up
    click_on("Log Out")
    sign_in
    expect(page).to have_content "Signed in successfully."
  end
end
