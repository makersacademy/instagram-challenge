require 'rails_helper'

feature 'Users' do
  context 'before sign in' do
    scenario 'should be able to see sign up link' do
      visit '/'
      expect(page).to have_link 'Sign up'
    end

    scenario 'should be able to see sign in link' do
      visit '/'
      expect(page).to have_link 'Sign in'
    end

    scenario 'should not be able to see sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'after signed in' do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'kmhicks92@gmail.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    scenario 'should not be able to see sign up link' do
      visit '/'
      expect(page).not_to have_link 'Sign up'
    end

    scenario 'should not be able to see sign in link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
    end

    scenario 'should be able to see sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end
  end

  context 'viewing their profile' do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'kmhicks92@gmail.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    scenario 'should see their email' do
      visit '/'
      click_link 'Profile'
      expect(page).to have_content 'kmhicks92@gmail.com'
    end
  end
end
