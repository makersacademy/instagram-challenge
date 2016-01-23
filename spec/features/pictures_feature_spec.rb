require 'rails_helper'

feature 'Pictures' do
  # As a user
  # So that I can use Instagram
  # I would like to post pictures on it

  context 'no pictures have been posted' do
    scenario 'should show a button to post a picture' do
      visit '/pictures'
      expect(page).to have_button('Post a picture')
    end
  end
end
