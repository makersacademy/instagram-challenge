require 'rails_helper'

feature 'Feature - comments' do
  before  do
    sign_up
    add_a_picture
    sign_out
    sign_up("user2", "user2@test.com", "123456")
  end

  context 'adding comments' do
    scenario "user can add a comment to another user's picture" do
      add_comment
      expect(page).to have_content "Why do you do these things?"
      expect(page).to have_content "user2"
    end
  end
end
