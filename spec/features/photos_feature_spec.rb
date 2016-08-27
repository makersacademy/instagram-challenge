require 'rails_helper'

feature 'Photos' do

  context 'Posting a new photo' do

    scenario 'must be signed in to post a new photo' do
      visit '/photos/new'
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'user can select a photo to upload' do
      sign_up
      click_link 'Add a new photo'
      expect(page).to have_field 'Photo url'
      expect(page).to have_field 'Description'
    end

    scenario 'user can post a new photo' do
      sign_up(username: 'arukomp')
      create_photo(photo_url: 'something.png', description: 'helooo')
      expect(current_path).to eq '/arukomp'
      expect(page).to have_content 'helooo'
      expect(page).to have_xpath("//img[contains(@src, 'something.png')]")
    end

  end

  context 'Viewing an individual photo' do

    let!(:photo) { Photo.create(photo_url: 'something.png', description: 'Something nice') }
    scenario 'can view an individual photo' do
      visit '/'
      find("//a[@id='#{photo.id}']").click
      expect(current_path).to eq "/photos/#{photo.id}"
      expect(page).to have_content 'Something nice'
      expect(page).to have_xpath("//img[contains(@src, 'something.png')]")
    end

    scenario 'does not let you view a photo that does not exist' do
      visit "/photos/#{photo.id + 1}"
      expect(current_path).to eq '/'
    end

  end

  context 'Editing photo\'s description' do

    before do
      sign_up
      create_photo
    end

    let(:photo) { Photo.last }

    scenario 'owner can edit his photo description' do
      visit "/photos/#{photo.id}"
      click_link 'Edit'
      fill_in 'Description', with: 'Alternative description'
      click_button 'Save changes'
      expect(page).to have_content 'Alternative description'
    end

    scenario 'a different user cannot edit another person\'s photo' do
      sign_out
      sign_up(email: 'hi@google.com', username: 'hithere')
      visit "/photos/#{photo.id}"
      expect(page).to_not have_link 'Edit'
    end

  end

  context 'Deleting a photo' do

    before do
      sign_up
      create_photo(description: 'really interesting description')
    end

    let(:photo) { Photo.last }

    scenario 'owner can delete his photos' do
      visit "/photos/#{photo.id}"
      click_link 'Delete'
      expect(page).to have_content 'Photo has been deleted'
      expect(page).to_not have_content 'really interesting description'
    end

    scenario 'a different user cannot delete another person\'s photo' do
      sign_out
      sign_up(email: 'hi@google.com', username: 'hithere')
      visit "/photos/#{photo.id}"
      expect(page).to_not have_link 'Delete'
    end

  end

end
