require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos to display yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  before do
    Timecop.freeze(Time.new(2017, 5, 6, 15, 0, 0))
  end

  context 'photos have been added' do
    before do
      Photo.create(caption: 'Avocado and Scrambled eggs #Living')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('Avocado and Scrambled eggs #Living')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'uploading photos' do
    # before do
    #   Timecop.freeze(Time.new(2017, 5, 6, 15, 0, 0))
    # end

    scenario 'prompts user to fill out form, then displays the new photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Caption', with: 'Avocado and Scrambled eggs #Living'
      click_button 'Upload Photo'
      expect(page).to have_content 'Avocado and Scrambled eggs #Living'
      expect(page).to have_content '06/05/2017 14:00'
      expect(current_path).to eq '/photos'
    end
  end

  context 'viewing photos' do

    scenario 'lets a user view a photo' do
      Photo.create(caption: 'Avocado and Scrambled eggs #Living')
      visit '/photos'
      click_link 'Avocado and Scrambled eggs #Living'
      expect(page).to have_content 'Avocado and Scrambled eggs #Living'
      expect(page).to have_content '06/05/2017 14:00'
      expect(current_path).to eq "/photos/#{Photo.last.id}"
    end
  end
end
