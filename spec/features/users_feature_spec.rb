require 'rails_helper'

feature 'User can sign in and out' do
  context 'User not signed in and on the homepage' do
    it 'should see a \'sign in\' link and a \'sign up\' link' do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it 'should not see \'sign out\' link' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end

    it 'can create posts only if logged in' do
      visit('/')
      click_link('Add a post')
      expect(page).to have_content('Log in')
    end

    it 'can only edit/delete posts which it has created' do
      sign_up
      create_post
      click_link('Sign out')
      click_link('Delete')
      expect(page).to have_content('Log in')
    end
  end

  context 'user signed in on the homepage' do
    before do
      sign_up
    end

    it 'should see \'sign out \' link' do
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    it 'should see it\'s username displayed' do
      expect(page).to have_content('babyboo')
    end

  end
end
