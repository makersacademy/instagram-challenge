require 'rails_helper'

describe 'User' do

  context 'not signed in and on homepage' do

    it 'should see sign in and sign up links' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'should not see a sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

  end

  context 'signed in' do

    before do
      visit '/'
      click_link 'Sign up'
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it 'should see sign out' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end

end