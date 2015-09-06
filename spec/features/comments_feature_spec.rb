require 'rails_helper'

feature 'commenting' do
  let(:user) { create :user }

  before { Image.create caption: 'Test caption' }

  context 'when logged in' do
    scenario 'allows users to leave a comment using a form' do
      sign_in(user)
      visit '/'
      fill_in "Message", with: "Test comment"
      click_button 'Leave Comment'
      expect(current_path).to eq '/images'
      expect(page).to have_content('Test comment')
    end
  end

  context 'when not logged in' do
    scenario 'prompts a user to log in or sign up before continuing' do
      visit '/'
      fill_in "Message", with: "Test comment"
      click_button 'Leave Comment'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  def sign_in(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

end
