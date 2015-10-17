require 'rails_helper'

feature 'adding photos' do
  context 'no photo has been added' do
    scenario 'should display a prompt to add photo' do
      visit '/photos'
      expect(page).to have_content 'No photo yet'
      expect(page).to have_link 'Add photo'
    end
  end
  
  scenario 'can add photo' do
    visit '/photos'
    click_link 'Add photo'
    fill_in 'Title', with: 'NYC'
    attach_file 'photo[image]', 'spec/fixtures/images/nyc.jpg'
    click_button 'Upload photo'
    expect(page).to have_content 'NYC'
    expect(page).to have_selector(:css, "img[src*='nyc.jpg']")
    expect(current_path).to eq '/photos'
  end
end
