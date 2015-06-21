require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display no photos' do
      visit '/photos'
      expect(page).to have_content 'No photos added'
      expect(page).to have_link 'Add photo'
    end
  end

  context 'photo has been added' do
    before do
      Photo.create(caption: 'My pet', user: 'Mike', likes: 3)
    end

    scenario 'display photos' do 
      visit '/photos'
      expect(page).to have_content 'My pet'
      expect(page).not_to have_content 'No photos added'    
    end
  end
end

    # attach_file "Add photos", "spec/asset_specs/photos/photo.jpg"
    # click_button "Add photos"
    # expect(page).to have_selector("img")


# http://www.charliemassry.com/posts/29-testing-paperclip-with-rspec-capybara-and-factory-girl