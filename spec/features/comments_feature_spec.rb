require 'rails_helper'

feature 'commenting' do
  before do
    sign_up
    upload_photo
  end

  context 'signed in user' do

    scenario 'cannot leave empty comment' do
      visit "/photos/#{Photo.last.id}"
      click_button 'Comment'
      expect(page).to have_content 'Comment field must not be empty'
    end

    scenario 'allows user to leave a comment using a form' do
      visit "/photos/#{Photo.last.id}"
      leave_comment('Stunning!')
      expect(page).to have_content 'Stunning!'
      expect(current_path).to eq "/photos/#{Photo.last.id}"
    end

    scenario 'allows user to leave multiple comments' do
      visit "/photos/#{Photo.last.id}"
      leave_comment('Stunning!')
      leave_comment('Not for me thank you')
      expect(page).to have_content 'Stunning!'
      expect(page).to have_content 'Not for me thank you'
    end
  end

  context 'signed out user' do
    before { click_link 'Sign out' }

    scenario 'cannot leave a comment' do
      visit "/photos/#{Photo.last.id}"
      leave_comment('Stunning!')
      expect(page).not_to have_content 'Stunning!'
      expect(current_path).to eq '/users/sign_in'
    end
  end
end
