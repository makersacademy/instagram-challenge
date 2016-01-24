require 'rails_helper'

feature 'photos' do
  context 'viewing photos' do
    scenario 'no photos added' do
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet!'
    end
    scenario 'should display a prompt to add a picture' do
      visit '/photos'
      expect(page).to have_link('Upload photo')
      expect(page).to have_content 'No photos uploaded yet!'
    end
  end

  context 'creating photos' do
    scenario 'user is able to upload a photo' do
      visit '/photos'
      click_link 'Upload photo'
      attach_file('photo[image]', "spec/fixtures/files/teckel.jpeg")
      fill_in 'Caption', with: 'cutie'
      click_button 'Upload photo'
      expect(page).to have_css("img[src*='teckel.jpeg']")
    end

    scenario 'an image must be uploaded during photo upload' do
      visit '/photos'
      click_link 'Upload photo'
      fill_in 'Caption', with: 'cutie'
      click_button 'Upload photo'
      expect(page).to have_content 'Please upload photo'
    end
  end


end


# def post_a_picture
#   visit '/pictures'
#   click_link 'Post a picture'
#   fill_in 'Title', with: 'My cat is awesome'
#   page.attach_file 'picture[image]', './spec/support/cat.jpg'
#   click_button 'Post picture'
# end
