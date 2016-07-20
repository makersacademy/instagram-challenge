require 'rails_helper'
require_relative '../web_helpers'

describe 'Users features' do

  context 'when a picture has been created and user is logged in' do

    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user, email: '2@2.2') }
  
    before do
      login_as(user1, scope: :user)
      FactoryGirl.create(:picture, user: user1)
    end

    #US4
    #As a user of InstaRails
    #So I can delete some or all of my pictures and prevent other users from doing so
    #I want to sign up/sign in/sign out
    scenario 'user deletes picture, this is not shown in pictures index page' do
      visit('/pictures')
      click_button('Delete')
      expect(page).not_to have_content('lovely pic')
    end
  end

  context 'when a picture has been created by another user' do
  
    before do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user, email: '2@2.2')
      login_as(user1, scope: :user)
      FactoryGirl.create(:picture, user: user1)
      logout(user1)
      login_as(user2, scope: :user)
    end

    #US2
    #As a user of InstaRails
    #So I can express my opinions on pictures
    #I want to add a comment for a picture
    scenario('user adds a comment to a picture, this is shown on pictures index page') do
      visit('/pictures')
      click_link('Add comment')
      fill_in('Comment', with: 'lovely shot')
      click_button('Submit')
      expect(page).to have_content('lovely shot')
    end

    #US3
    #As a user of InstaRails
    #So I can quickly express my opinions on pictures
    #I want to add a like for a picture
    scenario 'user adds a like to a picture, Likes count is updated' do
      visit('/pictures')
      expect(page).to have_content('Like 0')
      click_link('Like')
      expect(page).to have_content('Like 1')
    end

    #US5
    #As a user of InstaRails
    #So I know who commented on my pictures
    #I want only logged in users to be able to leave a comment
    scenario 'second user cannot see the delete button' do
      visit('/pictures')
      expect(page).not_to have_button('Delete')
    end

    #US6
    #As a user of InstaRails
    #So the comments on my pictures do not get overcrowded
    #I want any user to only be able to leave one comment per picture
    scenario 'second user can only add one comment' do
      visit('/pictures')
      click_link('Add comment')
      fill_in('comment_comment', with: 'first comment')
      click_button('Submit')
      visit('/pictures')
      expect(page).not_to have_link('Add comment')
    end
  end
end
