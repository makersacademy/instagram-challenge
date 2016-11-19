require 'rails_helper'
require 'paperclip/matchers'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'New Post'
    end
  end


  context 'photos have been added' do
    scenario 'display photos' do
      visit '/photos'
      click_link 'New Post'
      attach_file 'File', 'spec/assets/photos/donuts.jpg'
      fill_in 'Caption', with: 'donuts'
      expect(page).to have_content('donuts')
      expect(page).not_to have_content('No photos yet')
    end
  end

#   context 'editing photos' do
#
#   before { Photo.create image: 'KFC', caption: 'Lovely grumpy cat' }
#
#   scenario 'let a user edit a photo' do
#    visit '/photos'
#    click_link 'Edit KFC'
#    fill_in 'Name', with: 'Kentucky Fried Chicken'
#    fill_in 'Description', with: 'Deep fried goodness'
#    click_button 'Update Restaurant'
#    expect(page).to have_content 'Kentucky Fried Chicken'
#    expect(page).to have_content 'Deep fried goodness'
#    expect(current_path).to eq '/restaurants'
#   end
#
# end

end
