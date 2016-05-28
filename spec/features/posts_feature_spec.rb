require 'rails_helper'

feature "User can upload images as posts" do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form with an image, then displays the post' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Iron Man Beta'
      attach_file('Image', Rails.root + "spec/fixtures/Iron-Man-Beta.jpg")

      click_button 'Create Post'
      expect(current_path).to eq '/posts'

      expect(page).to have_content 'Iron Man Beta'
      expect(page).to have_css("img[src*='Iron-Man-Beta.jpg']")
    end

    scenario 'prompts user to log in if signed out before creating a post' do
      click_link 'Sign out'
      visit '/posts'
      click_link 'New Post'
      expect(page).to have_content 'Sign in'
    end
  end
end
