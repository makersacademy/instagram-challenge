require 'rails_helper'

feature 'photos' do 

  context 'no photos have been added' do 
    scenario 'should display a prompt to add a photo' do 
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end
  end  

  context 'photo have been added' do
    before do
      Photo.create(caption: 'sunrise')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('sunrise')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'posting photos' do
    scenario 'prompts user to fill out a form, then displays the new photo caption' do
      visit '/photos'
      click_link 'Post a photo'
      fill_in 'Caption', with: 'sunrise'
      click_button 'Post photo'
      expect(page).to have_content 'sunrise'
      expect(current_path).to eq '/photos'
    end
  end

  context 'viewing photos' do

    let!(:sunrise){Photo.create(caption:'sunrise')}

    scenario 'lets a user view a photo' do
     visit '/photos'
     click_link 'sunrise'
     expect(page).to have_content 'sunrise'
     expect(current_path).to eq "/photos/#{sunrise.id}"
    end

  end

end
