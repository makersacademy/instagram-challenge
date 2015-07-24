require 'rails_helper'

feature 'Images' do
  
  scenario "allows creation" do
    visit '/images/new'
    expect(page).to have_selector 'form'
  end

  context 'none have been uploaded' do
    scenario 'should let the user know there are no images' do
      visit '/images'
      expect(page).to have_content 'No images yet'
    end
  end

end
