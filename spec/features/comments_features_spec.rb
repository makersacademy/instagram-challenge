require 'rails_helper'

feature 'Comments' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:image) { FactoryGirl.create(:image, user_id: user.id) }

  context 'user not logged in' do
    scenario 'cannot add a comment to an image' do
      visit "/images/#{image.id}"
      click_link 'Add Comment'
      expect(current_url).to have_content '/users/sign_in'
    end
  end

  context 'user logged in' do
    scenario 'sees a form to add a comment to an image' do
      login_as(user, :scope => :user)
      visit "/images/#{image.id}"
      click_link 'Add Comment'
      expect(page).to have_selector 'form'
    end

    context 'adding a comment' do

      scenario 'after adding a comment can see it on the image page' do
        login_as(user, :scope => :user)
        visit "/images/#{image.id}"
        click_link 'Add Comment'
        fill_in 'comment[content]', with: 'So cute!'
        click_button 'Create Comment'
        expect(current_url).to have_content "/images/#{image.id}"
        expect(page).to have_content 'So cute!'
      end

      scenario 'it cannot be blank' do
        login_as(user, :scope => :user)
        visit "/images/#{image.id}"
        click_link 'Add Comment'
        click_button 'Create Comment'
        expect(current_url).to have_content "/images/#{image.id}/comments/new"
        expect(page).to have_content 'Cannot post an empty comment'
      end

    end

    context 'deleting comment' do

      scenario 'is possible if the user created it' do
        comment = image.comments.create_with_user({content: 'Adorable'}, user)
        login_as(user, :scope => :user)
        visit "/users/#{user.id}"
        find("#delete_comment_#{comment.id}").click
        expect(page).to have_content 'Comment deleted successfully'
      end

      scenario 'is not possible if the user did not create it' do
        another_user = FactoryGirl.create(:user)
        comment = image.comments.create_with_user({content: 'Adorable'}, another_user)
        login_as(user, :scope => :user)
        visit "/users/#{user.id}"
        find("#delete_comment_#{comment.id}").click
        expect(page).to have_content 'You did not leave this comment'
      end

    end
  end

end
