require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures added yet'
      expect(page).to have_link 'Add a picture'
    end
  end

# change pictures to comments instead
  context 'pictures have been added' do  
  before do
    Picture.create(name: 'cool')
  end

  scenario 'display picture comments' do
    visit '/pictures'
    expect(page).to have_content('cool')
    expect(page).not_to have_content('No pictures added yet')
  end
  end
end