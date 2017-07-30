
require "rails_helper"

RSpec.feature "User commenting", type: :feature do

  before do
    visit '/'
    sign_up
    create_pic
  end

  context "when user is signed in" do

    scenario "they can view comment forms on individual pics" do
      click_on "View Picture 1"
      expect(page).to have_content("Leave a comment")
    end

    scenario "and they can create a comment there" do
      click_on "View Picture 1"
      leave_comment
      expect(page).to have_content("Comment saved!")
    end

  end

  context "when user is not registered or signed in" do

    scenario "comment forms are missing" do
      sign_out
      visit '/'
      click_on "View Picture 1"
      expect(page).to_not have_content("Leave a comment")
    end
  end

  

end
