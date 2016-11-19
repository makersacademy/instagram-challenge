require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content('No images yet')
      expect(page).to have_link('Add an image')
    end
  end

  context 'images have been added' do
    before do
      Image.create(description: 'Sunday')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content('Sunday')
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'creating images' do
    scenario 'prompts a user to fill out a form, then displays the new image' do
      visit '/images'
      click_link 'Add an image'
      expect(current_path).to eq '/images/new'
    end

    scenario 'prompts a user to fill out a form, then displays the new image' do
      visit '/images/new'
      fill_in 'Description', with: 'Sunday'
      click_button 'Create Image'
      expect(page).to have_content 'Sunday'
      expect(current_path).to eq '/images'
    end
  end

  context 'viewing images' do

    let!(:sunday){ Image.create(description:'Sunday') }

    scenario 'lets a user view an image' do
      visit '/images'
      click_link 'Sunday'
      expect(page).to have_content 'Sunday'
      expect(current_path).to eq "/images/#{sunday.id}"
    end
  end

  context 'editing images' do
    before { Image.create description: 'Sunday', url: 'http://cdn.pcwallart.com/images/morning-sunrise-city-wallpaper-2.jpg'}

    scenario 'let a user edit an image' do
      visit '/images'
      click_link 'Edit Sunday'
      fill_in 'Description', with: 'Sunday morning'
      fill_in 'Url', with: 'http://cdn.pcwallart.com/images/morning-sunrise-city-wallpaper-2.jpg'
      click_button 'Update Image'
      expect(page).to have_content 'Sunday morning'
      expect(page).to have_css("img[src*='http://cdn.pcwallart.com/images/morning-sunrise-city-wallpaper-2.jpg']")
      expect(current_path).to eq '/images'
    end
  end
end
