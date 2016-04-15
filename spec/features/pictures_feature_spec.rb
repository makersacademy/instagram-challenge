require 'rails_helper'

feature 'pictures' do
  scenario 'no pictures have been added' do
    visit '/pictures'
    expect(page).to have_content 'No pictures yet!'
    expect(page).to have_link 'Add pictures'
  end

  context 'pictures have been added' do
    before do
      Picture.create(description: '#sun #spring')
    end
    
    scenario 'displays pictures' do
      visit '/pictures'
      expect(page).to have_content '#sun #spring'
      expect(page).not_to have_content 'No pictures yet!'
    end
  end
end
