require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    it 'should see a "sign in" link and a "sign up" link' do
      visit('/')
      expect(page).to have_link('sign in')
      expect(page).to have_link('sign up')
    end

    it 'should not see a "sign out" link' do
      visit('/')
      expect(page).not_to have_link('sign out')
    end
  end

  context 'user signed in and on the homepage' do
    before do
      sign_up
    end

    it 'should see a "sign out" link' do
      visit('/')
      expect(page).to have_link('sign out')
    end

    it 'should not see a "sign in" link or a "sign up" link' do
      visit('/')
      expect(page).not_to have_link('sign in')
      expect(page).not_to have_link('sign up')
    end
  end
end
