require 'rails_helper'

describe 'Restaurants' do
  context 'No restaurants have been added' do
    it 'displays a prompt to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants found'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'Front page updating from none to one' do
    before do
      Restaurant.create(name: 'Nobu')
      end
    it 'displays a restaurant when added' do
      visit '/restaurants'
      expect(page).to have_content 'Nobu'
      expect(page).not_to have_content 'No restaurants found'
    end
  end

  context 'Creating a new restaurant' do
    it 'has a form that can be filled out' do
      visit '/restaurants'
      click_link 'Add a restaurant' 
      fill_in 'Name', with: 'Galvin la Chappelle'
      fill_in 'Description', with: 'Bare banging food bruv. Would spit at again'
      click_button 'Submit restaurant'
      expect(page).to have_content 'Galvin la Chappelle'
      expect(current_path).to eq '/restaurants'
    end

    it 'cannot create a restaurant with a name that is less than 3 chars' do
      visit '/restaurants/new'
      fill_in 'Name', with: 'Th'
      click_button 'Submit restaurant'
      expect(page).not_to have_css 'h2', text: 'Th'
      expect(page).to have_content 'The restaurant name is too short'
    end
      
    it 'can only create restaurants with unique names' do
      Restaurant.create(name: 'The Fat Duck')
      visit '/restaurants/new'
      fill_in 'Name', with: 'The Fat Duck'
      click_button 'Submit restaurant'
      expect(page).to have_content 'Restaurants must have a unique name'
    end 
  end

  context 'Updating a restaurant' do
    before do
      Restaurant.create(name: 'The FD',
                        description: 'What did I just eat?')
    end
    it 'can be updated' do
      visit '/restaurants'
      click_link 'Edit The FD'
      fill_in 'Name', with: 'The Fat Duck'
      click_button 'Submit restaurant'
      expect(page).to have_content 'The Fat Duck'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'Deleting a restaurant' do
    before do
      Restaurant.create(name: 'The Fat Duck',
                        description: 'What did I just eat?')
    end
    it 'can be deleted' do
    visit '/restaurants'
    click_link 'Delete The Fat Duck'
    expect(page).to have_content 'Restaurant deleted'
    end
  end

  context 'Showing a description' do
    before do
      Restaurant.create(name: 'The Fat Duck',
                        description: 'What did I just eat?')
    end
    it 'shows its description' do
      visit '/restaurants'
      click_link 'The Fat Duck'
      expect(page).to have_content 'What did I just eat?'
      expect(current_path).to match /restaurants\/\d/ 
      click_link 'Return to restaurants'
      expect(current_path).to eq '/restaurants'
    end
  end
end

