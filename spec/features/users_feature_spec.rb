require 'rails_helper'

feature 'user can sign in and out' do

  context 'user not signed in on homepage' do

    it 'should see sign in and sing up links' do
      visit('/')
      expect(page).to have_content('Sign in')
      expect(page).to have_content('Sign up')
    end

    it 'should not see a sign out link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in on homepage' do

    before do
      user = create(:user)
      sign_in_as(user)
    end

    it 'should not see sign out link' do
      visit('/')
      expect(page).to have_link('Sign out')
      expect(page).to have_content('test_user@test.com')
    end

    it 'should not see sign up or sign in links' do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
