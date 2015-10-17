require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been uploaded' do

    scenario 'should have link to upload a picture' do
      visit '/pictures'
      expect(page).to have_content "No one has uploaded any pictures yet"
      expect(page).to have_link "Upload a picture"
    end

  end

end
