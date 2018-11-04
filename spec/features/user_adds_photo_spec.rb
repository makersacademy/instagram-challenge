require 'rails_helper'

RSpec.feature "Add photo", type: :feature do

  scenario "User can add a photo" do
    user_sign_up

    click_link "Add photo"

    expect(page).to have_content("Image")
  end
end
