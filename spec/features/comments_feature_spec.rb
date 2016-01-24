require 'rails_helper'

RSpec.feature '<<Comments>>' do

  include ActiveSupport::Testing::TimeHelpers

    before do
      sign_up_1
      add_picture
      visit_picture
      post_comment
    end

    scenario 'users may comment on an image' do
      expect(page).to have_content 'Arggh!'
    end

    scenario 'comments should show user name and timestamp' do
      travel_to(1.hour.ago) do
        visit_picture
        post_comment
      end
      visit_picture
      expect(page).to have_content 'Blackbeard'
      expect(page).to have_content 'Posted about 1 hour ago'
    end

    context 'editing comments' do
      scenario 'a user may edit their own comments' do
        visit_picture
        click_link 'Edit comment'
        fill_in 'Message', with: 'Avast!'
        click_button 'Post comment'
        expect(page).to have_content 'Avast!'
        expect(page).not_to have_content 'Arggh!'
      end

      scenario 'a user may not edit anothers comments' do
        click_link 'Sign out'
        sign_up_2
        visit_picture
        expect(page).not_to have_link 'Edit comment'
      end
    end

    context 'deleting comments' do
      scenario 'a user may delete their own comments' do
        visit_picture
        click_link 'Delete comment'
        expect(page).to have_content 'Comment deleted'
        expect(page).not_to have_content 'Arggh!'
      end

      scenario 'a user may not delete anothers comments' do
        click_link 'Sign out'
        sign_up_2
        visit_picture
        expect(page).not_to have_link 'Delete comment'
      end
    end
  context 'when a user is not signed in' do
    scenario 'a user may not post a comment' do
      click_link 'Sign out'
      visit_picture
      expect(page).to_not have_link 'Post a comment...'
    end
  end
end
