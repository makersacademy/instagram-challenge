require 'rails_helper'

feature 'pictures' do
  context 'no images have been added' do
    scenario 'should display link to add a picture' do
    visit '/pictures'
    expect(page).to have_content 'No pictures added yet'
    expect(page).to have_link 'Add a picture'
    end
  end
end
