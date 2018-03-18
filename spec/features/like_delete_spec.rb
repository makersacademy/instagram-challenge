require 'rails_helper'

feature "unlike a picture from picture#show" do
  scenario "when user has already liked this picture" do
    sign_up
    create_picture
    click_button "Like"
    click_button "Unlike"
    expect(page).to have_current_path "/pictures/1"
    expect(page).to have_content "Liked by 0 users"
    expect(page).to have_button "Like"
    expect(page).not_to have_button "Unlike"
  end
end
