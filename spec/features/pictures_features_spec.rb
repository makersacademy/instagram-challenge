require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should diplay a prompt to upload a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Upload a picture'
    end
  end

  # context 'pictures have been added' do
  #   before do
  #     Picture.create
  #   end
  #
  # end
end
