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

end
