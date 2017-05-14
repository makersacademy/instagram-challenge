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
end

  context 'show pictures' do
    let!(:nomnom){ Picture.create(status:'Broccoli is my favourite!') }
    scenario 'show pictures' do
    visit "/pictures/#{nomnom.id}"
    expect(page).to have_content 'Broccoli is my favourite!'
    end

  context 'posting pictures' do
    let!(:exercise){ Picture.create(status:'Good 10 mile run in the wheel last night #BeachBod2017 #feelinggood') }
    scenario 'prompts user to post image with status, then display image' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Status', with: 'Good 10 mile run in the wheel last night #BeachBod2017 #feelinggood'
      click_button 'Create Picture'
      expect(current_path).to eq '/pictures'
      visit "/pictures/#{exercise.id}"
      expect(page).to have_content 'Good 10 mile run in the wheel last night #BeachBod2017 #feelinggood'
    end
  end

  context 'viewing pictures' do
    let!(:nomnom){ Picture.create(status: "I love sweetcorn, can't get enough! #sweetcornsundays") }
    scenario 'lets a user see a picture' do
    visit "/pictures/#{nomnom.id}"
    expect(page).to have_content "I love sweetcorn, can't get enough!"
    end
  end

  context 'editing status' do
      let!(:nuts){ Picture.create(status: "#PrayforCarrotTown after rabbit carrot burglary") }
      scenario 'let a user edit a status' do
      visit '/pictures'
      visit "/pictures/#{nuts.id}"
      click_link 'Edit'
      fill_in 'Status', with: '100 Carrots found hidden in rabbit hole!'
      click_button 'Update Picture'
      visit "/pictures/#{nuts.id}"
      expect(page).to have_content '100 Carrots found hidden in rabbit hole!'
      expect(page).not_to have_content '#PrayforCarrotTown after rabbit carrot burglary'
    end
  end

  context 'deleting picture' do
  let!(:couplegoals){ Picture.create(status: "Love snuggling up with ma girlfriend in our new treehouse! #couplegoals" ) }
  scenario 'removes a picture when a hamster clicks delete link' do
    visit "/pictures/#{couplegoals.id}"
    click_link "Delete"
    expect(page).not_to have_content 'Love snuggling up with ma girlfriend in our new treehouse! #couplegoals'
    expect(page).to have_content 'Picture deleted successfully'
    end
  end
end
