require 'rails_helper'

feature 'Pictures' do

  describe 'no pictures have been added' do
    it 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures here 😳'
      expect(page).to have_link 'Add a picture'
    end
  end


end
