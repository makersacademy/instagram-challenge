require 'rails_helper'

feature 'Photos' do

  context 'no photos have been added' do

    it 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to(have_content("No photos yet"))
      expect(page).to(have_link("Add a photo"))
    end

  end

  context 'photos have been added' do

    before do
      Photo.create(caption: "this is a photo")
    end

    it 'should display the added photo' do
      visit '/photos'
      expect(page).to(have_content("this is a photo"))
      expect(page).not_to(have_content("No photos yet"))
    end

  end

  context 'adding photos' do

    it 'prompts a user to add a caption' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Caption', with: 'This is my first photo'
      click_button 'Create Photo'
      expect(page).to(have_content("This is my first photo"))
      expect(current_path).to(eq('/photos'))
     end

  end

end
