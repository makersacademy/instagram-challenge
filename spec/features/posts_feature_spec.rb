require 'rails_helper'

feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content('No posts yet')
      expect(page).to have_link('Add a post')
    end
  end

  context 'posts have been added' do
    before do
      Post.create(comment: 'Photo of me')
    end

    scenario 'display posts' do
      visit '/'
      expect(page).to have_content('Photo of me')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'if user is not signed in' do
    scenario 'redirects to log in page' do
      visit '/'
      click_link('Add a post')
      expect(page).to have_content('Log in')
      expect(page).to have_link('Sign up')
    end
  end

  context 'user is signed in' do
    before do
      visit("/")
      click_link("Sign up")
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    context 'creating posts' do
      scenario 'prompts user to fill out a form, then displays the new post' do
        visit '/'
        click_link('Add a post')
        fill_in :post_comment, with: 'testing'
        click_button('Create Post')
        expect(page).to have_content('testing')
        expect(current_path).to eq('/posts')
      end
    end
  end
end
