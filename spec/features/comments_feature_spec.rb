require "rails_helper"

feature "adding comments" do
  before do
    photo = FactoryGirl.create(:photo)
  end

  scenario "allows user to add a comment to a photo" do
    visit photos_path
    fill_in :comment_content, with: "So cute so fluffy!"
    click_button "Send"
    expect(page).to have_content "So cute so fluffy!"
  end
end
