require 'rails_helper'

feature 'pictures' do

    scenario 'link for adding pictures' do
      visit '/pictures'
      expect(page).to have_link 'share a picture'
    end

end
