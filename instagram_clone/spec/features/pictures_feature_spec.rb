require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures added yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
  before do
    Picture.create(comment: 'follow')
  end

  scenario 'display picture comments' do
    visit '/pictures'
    expect(page).to have_content('follow')
    expect(page).not_to have_content('No pictures added yet')
  end
  end
end