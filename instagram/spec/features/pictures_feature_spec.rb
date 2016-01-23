require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been posted' do
    scenario 'should display a prompt to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end
end
