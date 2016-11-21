require 'rails_helper'
require 'paperclip/matchers'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'New Post'
    end
  end


  context 'a photo have been added' do
    scenario 'display the added photo' do
      visit '/photos'
      click_link 'New Post'
      attach_file('Image', 'spec/files/photos/donuts.jpg')
      fill_in 'Caption', with: 'donuts'
      click_button 'Create Photo'
      expect(page).to have_content('donuts')
      expect(page).to have_css("img[src*='donuts.jpg']")
      expect(page).not_to have_content('No photos yet')
    end
  end

  # context 'photos have been added' do
  #   scenario 'the index displays a list of photos' do
  #     photo_one = create(:photo, caption: "This is post one")
  #     photo_two = create(:photo, caption: "This is second post")
  #
  #     visit '/'
  #     expect(page).to have_content("This is post one")
  #     expect(page).to have_content("This is second post")
  #     expect(page).to have_css("img[src*='donuts']")
  #   end
  # end

  context 'showing a photo' do

  before do
    visit '/photos'
    click_link 'New Post'
    attach_file('Image', 'spec/files/photos/donuts.jpg')
    fill_in 'Caption', with: 'donuts'
    click_button 'Create Photo'
  end

  scenario 'let a user click and view a single post' do
   visit '/photos'
   find(:xpath, "//a[contains(@href, 'photos/1')]").click
   expect(page.current_path).to eq '/photos/1'
  end

end

end
