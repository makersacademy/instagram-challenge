require 'rails_helper'

RSpec.feature "Deleting photos", type: :feature do
  scenario "A user who is signed in can delete their photo" do
    user = FactoryBot.create(:user)
    sign_in(user)
    post_photo
    expect(page).to have_content "This is my photo caption"
    expect(page).to have_content "Delete"
    click_link "Delete"
    expect(page).not_to have_content "This is my photo caption"
  end

  scenario "A user who is not signed can't delete a photo" do
    user = FactoryBot.create(:user)
    sign_in(user)
    post_photo
    click_link "Sign Out"
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Delete"
  end
end
