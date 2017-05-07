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

  context 'Viewing posts' do
    before do
      user = User.first
      user.posts.create(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool')
    end

    scenario 'Allows a user to view a post' do
    visit '/posts'
    expect(page).to have_content 'Cool'
    expect(page).to have_selector("img")
    end
  end

  context 'Deleting posts' do
    scenario 'Removes a post when user clicks delete' do
      user = User.first
      user.posts.create(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool')
      visit '/posts'
      click_link 'Delete post'
      expect(page).to have_content 'No posts yet'
      expect(page).not_to have_content 'Cool'
    end
  end

  context 'logged out' do
    before do
      user = User.first
      user.posts.create(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool')
      visit '/'
      click_link 'Sign out'
    end

    scenario 'Does not allow user to view new post page' do
      visit new_post_path
      expect(page).to have_content 'Sign up'
      expect(current_path).to eq '/users/sign_up'
    end

    scenario 'Does not allow user to delete post' do
      visit root_path
      expect(page).to have_content 'Cool'
      expect(page).not_to have_content 'Delete post'
    end
  end
end
