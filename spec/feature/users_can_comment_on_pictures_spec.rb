require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "Can comment on pictures" do
    create_account
    visit "/pictures"
    click_on "New picture"
    fill_in 'new_picture', with: "Kids"
    click_button "Upload Picture"
    expect(page).to have_content("Add a comment:")
    fill_in "Commenter",with: "Ana"
    fill_in "Body", with: "Awesome picture!"
    click_button "Create Comment"
    expect(page).to have_content("Awesome picture!")
  end
end
