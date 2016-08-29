require 'rails_helper'

feature 'Feature - comments' do
  before  do
    sign_up
    add_a_picture
    sign_out
    sign_up("seconduser", "second@somewhere.com", "123456")
  end

  context 'adding comments' do
    scenario "user can add a comment to another user's picture" do
      fill_in "Comment", with: "Why do you do these things?"
      click_link 'Add comment'
      expect(page).to have_content "Why do you do these things?"
      expect(page).to have_content "seconduser"
    end
  end
end
