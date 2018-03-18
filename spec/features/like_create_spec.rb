require 'rails_helper'

feature "like a picture form picture#show" do
  scenario "when user has not yet liked this picture" do
    sign_up
    create_picture
    click_button "Like"
    expect(page).to have_current_path "/pictures/1"
    expect(page).to have_content "Liked by 1 user"
    expect(page).to have_button "Unlike"
    expect(page).not_to have_button "Like"
  end
end
