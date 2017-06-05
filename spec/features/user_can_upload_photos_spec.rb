require 'rails_helper'

RSpec.feature "Photos",  type: :feature do

  scenario "can see an upload button when signed in", type: :feature do
    sign_up
    page.should have_button("Upload Photo")
  end

  scenario "can see an upload page", type: :feature do
    sign_up
    click_on "Upload Photo"
    expect(page).to have_content "New Photo"
  end

end
