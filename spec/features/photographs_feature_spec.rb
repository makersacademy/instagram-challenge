require 'rails_helper'

feature 'photographs' do
  context 'no photographs have been added' do
    scenario 'should display a prompt to add a photograph' do
      visit '/photographs'
      sign_up
      click_link 'Delete ocean'
      expect(page).to have_content 'No photographs yet'
      expect(page).to have_link 'Add a photograph'
    end
  end

  context 'photographs have been added' do
    before do
      Photograph.create(name: 'Ocean')
    end

    scenario 'display photograph' do
      visit '/photographs'
      expect(page).to have_content('Ocean')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating photographs' do
    scenario 'prompts user to fill out a form, then displays the new photographs' do
      photograph_upload
      expect(page).to have_content 'Sea'
      expect(page).to have_selector("img")
      expect(current_path).to eq '/photographs'
    end
  end

  context 'viewing photographs' do

    let!(:ocean){ Photograph.create(name:'ocean2') }

    scenario 'lets a user view a photographs' do
      visit '/photographs'
      click_link 'ocean2'
      expect(page).to have_content 'ocean2'
      expect(current_path).to eq "/photographs/#{ocean.id}"
    end
  end

  context 'editing photographs name' do
    scenario 'let a user edit a photographs name' do
      visit '/photographs'
      sign_up
      click_link 'Edit ocean'
      fill_in 'Name', with: 'Great blue sea'
      click_button 'Update Photograph'
      expect(page).to have_content 'Great blue sea'
      expect(current_path).to eq '/photographs'
    end
  end

  context 'deleting photographs' do

    scenario 'removes a photographs when a user clicks a delete link' do
      visit '/photographs'
      sign_up
      click_link 'Delete ocean'
      expect(page).not_to have_content 'ocean'
      expect(page).to have_content 'Photograph deleted successfully'
    end
  end

  context 'an invalid image file' do
    scenario 'does not let you submit a file that is not an image' do
      visit '/photographs'
      sign_up
      click_link 'Add a photograph'
      attach_file "photograph_image", "spec/spec_assets/text_file_spec.txt"
      fill_in 'Name', with: 'Ocean'
      click_button 'Create Photograph'
      expect(page).to have_content 'error'
    end
  end
end
