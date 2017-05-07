require 'rails_helper'
require_relative 'picture-helper'

feature 'pictures' do
  context 'no images have been added' do
    scenario 'should display link to add a picture' do
    visit '/pictures'
    expect(page).to have_content 'No pictures added yet'
    expect(page).to have_link 'Add a picture'
    end
  end

  context 'show pictures' do
    before do
      Picture.create(status: 'Broccoli is my favourite!')
    end
    scenario 'show pictures' do
    visit '/pictures'
    expect(page).to have_content 'Broccoli is my favourite!'
    expect(page).not_to have_content 'No pictures added yet'
    end
  end

  context 'posting pictures' do
    scenario 'prompts user to post image with status, then display image' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Status', with: 'Good 10 mile run in the wheel last night #BeachBod2017 #feelinggood'
      click_button 'Create Picture'
      expect(page).to have_content 'Good 10 mile run in the wheel last night #BeachBod2017 #feelinggood'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    scenario 'lets a user see a picture' do
    add_picture
    expect(page).to have_content "nomnom"
    expect(current_path).to eq "/pictures/#{nomnom.id}"
    end
  end
end
