require 'rails_helper'

feature 'pictures' do

    scenario 'link for adding pictures' do
      visit '/pictures'
      expect(page).to have_link 'share a picture'
    end

    context 'pictures have been added' do
      
      before do
        Picture.create(caption: 'sally')
      end

      scenario 'show all pictures' do
        visit '/pictures'
        expect(page).to have_content('sally')
      end

    end

end
