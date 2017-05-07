require 'rails_helper'

feature 'Posts' do

  before do
    User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  context 'No posts have been created' do
    scenario 'Should display a prompt to create a post' do
      visit root_path
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Create post'
    end
  end

  context 'Post has been added' do
    before do
      user = User.first
      user.posts.create(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool')
    end
    scenario 'Should show post' do
      visit root_path
      expect(page).to have_content 'Cool'
      expect(page).not_to have_content 'No posts yet'
    end
  end

  context 'Creating posts' do
    scenario 'Prompt user to create post, then display new post' do
      visit root_path
      click_link 'Create post'
      fill_in 'Caption', with: 'Cool'
      attach_file("Image", Rails.root + 'spec/fixtures/images/freedom-beach.jpg')
      click_button 'Create Post'
      expect(page).to have_selector("img")
      expect(page).to have_content("Cool")
    end
  end
end
