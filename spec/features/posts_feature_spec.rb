require 'rails_helper'

feature "User can upload images as posts" do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    @user = User.find_by(email: 'test@example.com')
  end

  context 'creating posts' do
    scenario 'prompts user to create post with an image, then displays the post' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Iron Man Beta'
      attach_file('Image', Rails.root + "spec/fixtures/Iron-Man-Beta.jpg")

      click_button 'Create Post'
      expect(current_path).to eq '/posts/new'
      expect(page).to have_content 'Post successfully created'

      visit '/posts'
      expect(page).to have_content 'Iron Man Beta'
      expect(page).to have_css("img[src*='Iron-Man-Beta.jpg']")
      expect(@user.posts.count).to eq 1
    end

    scenario 'does not allow a user to create a post without an image' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Iron Man Beta'

      click_button 'Create Post'
      expect(current_path).to eq '/posts/new'

      expect(page).to have_content 'You must upload an image to create a post'
      expect(@user.posts.count).to eq 0
    end

    scenario 'prompts user to log in if signed out before creating a post' do
      click_link 'Sign out'
      visit '/posts/new'
      expect(page).to have_content 'Sign in'
    end
  end

  context 'deleting posts' do
    scenario 'A user can delete their own post' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Iron Man Beta'
      attach_file('Image', Rails.root + "spec/fixtures/Iron-Man-Beta.jpg")
      click_button 'Create Post'

      visit '/posts'
      click_link 'Delete Post'
      expect(page).not_to have_content 'Iron Man Beta'
      expect(page).to have_content 'Post deleted successfully'
      expect(@user.posts.count).to eq 0
    end
  end
end
