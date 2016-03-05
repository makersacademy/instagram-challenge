require 'rails_helper'
require_relative '../helpers/auth_helper'
require_relative '../helpers/post_helper'

feature 'comments' do
  include Auth, Posts

  context 'no comments ' do
    scenario 'should display a link to add a comment' do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "test")
      expect(page).to have_content 'No comments'
      expect(page).to have_link 'Comment'
    end
  end

  context 'adding comments' do
    scenario 'a user should be able to add a comment to a post' do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "test")
      click_link 'Comment'
      fill_in "Comment", with: "this is a comment"
      click_button "Create Comment"
      expect(current_path).to eq '/'
      expect(page).to have_content 'this is a comment'
    end
  end

end
