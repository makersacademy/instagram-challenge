require 'rails_helper'

feature 'Users' do
  context 'when not logged in and on homepage' do
    it "should see a 'Sign Up' and 'Sign In' link" do
      visit '/'
      expect(page).to have_link 'Sign Up'
      expect(page).to have_link 'Sign In'
    end

    it "should not see a 'Sign Out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign Out'
    end

    it "should not see a 'New Post' link" do
      visit '/'
      expect(page).not_to have_link 'New Post'
    end
  end

  context 'when logged in and on hompeage' do

    before do
      visit '/'
      click_link 'Sign Up'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'test1234'
      fill_in 'Password confirmation', with: 'test1234'
      click_button 'Sign up'
    end

    it "should see a 'Sign Out' link" do
      visit '/'
      expect(page).to have_link 'Sign Out'
    end

    it "should not see a 'New Post' link" do
      visit '/'
      expect(page).to have_link 'New Post'
    end

    it "should not see a 'Sign Up' and 'Sign In' link" do
      visit '/'
      expect(page).not_to have_link 'Sign Up'
      expect(page).not_to have_link 'Sign In'
    end
  end

  context 'editing' do
    it 'user can only edit their own post' do
      visit('/')
      sign_up
      create_post
      click_link 'Sign Out'
      sign_up2
      expect(page).not_to have_link 'Edit'
    end
  end

  context 'deleting' do
    it 'user can only delete their own post' do
      visit('/')
      sign_up
      create_post
      click_link 'Sign Out'
      sign_up2
      expect(page).not_to have_link 'Delete'
    end
  end


end
