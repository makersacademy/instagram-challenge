require 'rails_helper'

feature 'photos' do

  context 'no photo have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'adding photo' do

    scenario 'should display a photo and his title' do
      visit '/photos'
      click_link 'Add a photo'
      attach_file 'Image', 'spec/features/sea.jpg'
      fill_in 'Title', with: 'Awesome sea'
      click_button 'Add photo'
      expect(page).to have_content 'Awesome sea'
      expect(page).to have_css('img[src*="sea.jpg"]')
    end

  end

  context 'Viewing photos' do

    let!(:sea) {Photo.create(title:'Awesome sea',
                             image: File.new("spec/features/sea.jpg") )}

    scenario 'Lets a user view profile page of a photo' do
      visit '/photos'
      click_link 'Show photo'
      expect(page).to have_content 'Awesome sea'
      expect(current_path).to eq "/photos/#{sea.id}"
    end

  end



end