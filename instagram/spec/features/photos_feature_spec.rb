require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to post a photos' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end


  context 'Photos have been added' do
    
    before {Photo.create description: 'Fujisan'}
    
    scenario 'Display photos' do
      visit '/photos'
      expect(page).to have_content 'Fujisan'
      expect(page).not_to have_content 'No photos yet'
    end
  end


	context 'Adding photos' do
    
    scenario 'Prompts user to add photo, then displays the description' do
      visit '/photos'
   	  click_link 'Add a photo'
      fill_in 'Description', with: 'Fujisan'
      click_button 'Add photo'
      expect(page).to have_content 'Fujisan'
      expect(current_path).to eq '/photos'
    end
  end


  context 'Viewing photos' do

  	let!(:fujisan){Photo.create(description:'Fujisan')}
    
    scenario 'lets a user view a photo' do
      visit '/photos'
   	  click_link 'Fujisan'
      expect(page).to have_content 'Fujisan'
      expect(current_path).to eq "/photos/#{fujisan.id}"
    end
  end

  context 'Deleting photos' do

  before {Photo.create(description:'Fujisan')}

  scenario 'removes a photo when a user clicks a delete link' do
    visit '/photos'
    click_link 'Delete Fujisan'
    expect(page).not_to have_content 'Fujisan'
    expect(page).to have_content 'Photo deleted successfully'
  end

end


end