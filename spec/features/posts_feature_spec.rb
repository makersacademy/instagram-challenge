require 'rails_helper'

feature 'posts' do
  context 'if no photos have been posted' do
    scenario 'display a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet...'
    end
  end

  context 'if photos have been posted' do
    before do
      Post.create(description: 'Sample post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'Sample post'
      expect(page).not_to have_content 'No posts yet...'
    end
  end

  context 'viewing a post' do
    let!(:post) { Post.create(description: 'Sample post') }

    scenario 'let a user view a post' do
      visit '/posts'
      click_link 'More'
      expect(page).to have_content 'Sample post'
      expect(current_path).to eq "/posts/#{post.id}"
    end
  end

  context 'posting a photo' do
    scenario 'redirects to log in page if user is not signed in' do
      visit '/posts'
      click_link 'Post a photo'
      expect(page).to have_content 'Log in'
      expect(page).not_to have_content 'Post'
    end

    scenario 'display a form to fill out, then display the post' do
      sign_up
      post_photo
      expect(page).to have_content 'Posted successfully'
      expect(page).to have_content 'Test post'
      expect(page).to have_css "img[src*='test-photo.png']"
    end
  end

  context 'editing a post' do
    before do
      sign_up
      post_photo
      log_out
    end

    context 'if user is not the post author' do
      scenario 'do not display edit link' do
        sign_up(email: 'other@email.com')
        expect(page).not_to have_link 'Edit'
      end
    end

    context 'if user is the post author' do
      scenario 'let the post author edit a post' do
        log_in
        click_link 'Edit'
        fill_in 'Description', with: 'New description'
        click_button 'Update'
        expect(page).to have_content 'New description'
      end
    end
  end

  context 'deleting a post' do
    before do
      sign_up
      post_photo
      log_out
    end

    context 'if user is not the post author' do
      scenario 'do not display delete link' do
        sign_up(email: 'other@email.com')
        expect(page).not_to have_link 'Delete'
      end
    end

    context 'if user is the post author' do
      scenario 'let the post author delete a post' do
        log_in
        click_link 'Delete'
        expect(page).not_to have_content 'Sample post'
        expect(page).to have_content 'Post deleted successfully'
      end
    end
  end
end
