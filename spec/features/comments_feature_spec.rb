require 'rails_helper'

feature 'comments' do
  context 'viewing comments' do
    before do
      sign_up
      post_photo
      leave_comment
      log_out
    end

    scenario 'display comments under a post' do
      log_in
      within('article.comment') do
        expect(page).to have_content 'Test comment'
      end
    end

    scenario 'display username of comment author' do
      log_in
      within('article.comment:last-child') do
        expect(page).to have_content 'test_user'
      end
    end
  end

  context 'leaving comments' do
    before do
      sign_up
      post_photo
      log_out
    end

    scenario 'display comments form under a post' do
      visit '/'
      expect(page).to have_css 'form#new_comment'
      expect(page).to have_button 'Comment'
    end

    context 'if user is not logged in' do
      scenario 'redirects user to log in page' do
        visit '/posts'
        leave_comment
        expect(page).to have_content 'Log in'
        expect(page).not_to have_content 'Test comment'
      end
    end

    context 'if user is logged in' do
      scenario 'let user leave a comment, which is displayed under the post' do
        log_in
        leave_comment
        expect(page).to have_content 'Test comment'
      end
    end
  end

  context 'deleting comments' do
    before do
      sign_up
      post_photo
      leave_comment
      log_out
    end

    context 'if user is not the post author' do
      scenario 'do not display delete link' do
        sign_up(email: 'other@email.com')
        expect(page).not_to have_content 'Delete'
      end
    end

    context 'if user is the post author' do
      scenario 'let user delete comment' do
        log_in
        within('article.comment') do
          click_link 'Delete'
        end
        expect(page).not_to have_content 'Test comment'
      end
    end
  end
end
