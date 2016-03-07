require 'rails_helper'
feature 'Comments' do
  # As a user
  # So that I can share my thoughts on a picture
  # I would like to write a comment on a picture

  context 'when signed in' do
    before(:each) do
      user = FactoryGirl.create(:user, :first)
      sign_in(user.email, user.password)
    end

    scenario 'a user can post a comment' do
      post_picture
      click_link 'Add a comment'
      fill_in 'Comment', with: 'A nice comment'
      click_button 'Comment'
      expect(page).to have_content 'A nice comment'
    end
  end

  context 'when not signed in' do
    scenario 'comments cannot be posted' do
      picture = FactoryGirl.create(:picture, user: FactoryGirl.create(:user, :first))
      visit '/'
      click_link 'Add a comment'
      expect(page).to have_content 'Log in'
      expect(page).not_to have_content 'Comment'
    end
  end
end
