require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo!'
    end
  end

  context 'photos have been added' do
    before do
      sign_up
      upload_photo
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('A fun trip to the beach!')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'uploading a photo' do
    scenario 'prompts user to fill in a description (for now), then desplays it' do
      sign_up
      visit '/photos'
      click_link 'Add a photo!'
      fill_in 'Description', with: "A fun trip to the beach!"
      click_button 'Upload photo'
      expect(page).to have_content 'A fun trip to the beach!'
      expect(current_path).to eq '/photos'
    end
  end

  context 'viewing photos' do
    let!(:photo) { Photo.create(description: 'A fun trip to the beach!')}

    scenario 'lets a user view a photo in full size' do
      visit '/photos'
      click_link 'A fun trip to the beach!'
      expect(page).to have_content "A fun trip to the beach!"
    end
  end

  context 'changing photos' do
    before do
      sign_up
      upload_photo
    end

    scenario "let a user edit the description for a photo" do
      visit '/photos'
      click_link "A fun trip to the beach!"
      click_link "Edit photo"
      fill_in "Description", with: "A terrible trip with terrible people"
      click_button "Update photo"
      click_link "A terrible trip with terrible people"
      expect(page).to have_content "A terrible trip with terrible people"

    end
  end

  context "deleting photos" do

    before do
      sign_up
      upload_photo
    end
    scenario 'deletes a photo' do
      visit '/photos'
      click_link "A fun trip to the beach!"
      click_link "Delete photo"
      expect(page).not_to have_content "A fun trip to the beach!"
      expect(page).to have_content "Photo deleted successfully"
    end
  end
end
