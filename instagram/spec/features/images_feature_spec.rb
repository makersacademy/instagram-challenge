require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add a image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add a image'
    end
  end

  context 'images have been added' do
    before do
      Image.create(name: 'Test')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content('Test')
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'creating images' do
    scenario 'prompts user to fill out a form, then displays the new image' do
      visit '/images'
      click_link 'Add a image'
      fill_in 'Name', with: 'Test'
      click_button 'Create Image'
      expect(page).to have_content 'Test'
      expect(current_path).to eq '/images'
    end
  end

  context 'viewing restaurants' do

  let!(:test1){ Image.create(name:'Test') }

  scenario 'lets a user view a restaurant' do
   visit '/restaurants'
   click_link 'Test'
   expect(page).to have_content 'Test'
   expect(current_path).to eq "/images/#{test1.id}"
  end

end
end
