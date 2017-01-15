require 'rails_helper'

feature 'Comments' do

  scenario "User can add a comment to a photo" do
    sign_up
    add_post
    click_link "Comment"
    fill_in "Add a comment", with: "Beautiful"
    click_button "Add"
    expect(current_path).to eq root_path
    expect(page).to have_content "Beautiful"
  end

end
