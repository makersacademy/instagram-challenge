require 'rails_helper'
include Devise::TestHelpers

describe 'photo features' do
  feature 'showing photos' do

    context 'no photos have been added' do
      scenario 'should display a prompt to add a photo' do
        visit '/photos'
        expect(page).to have_content 'No photos yet'
        expect(page).to have_link 'Upload a photo'
      end
    end

    context 'photos have been added' do
      let!(:photo) { create :test_photo, :first }
      let!(:second_photo) { create :test_photo, :second }

      scenario 'display photos' do
        visit '/photos'
        expect(page).not_to have_content('No photos yet')
        expect(page).to have_xpath("//img[contains(@src, \'thumb/test.png\')]")
      end

      scenario 'photos are in reverse chronological order' do
        visit '/photos'
        expect(page).to have_selector(:xpath, "//ul/li[1]/a/img[contains(@src,"\
                                      "\'thumb/test2.png\')]")
        expect(page).to have_selector(:xpath, "//ul/li[2]/a/img[contains(@src,"\
                                      "\'thumb/test.png\')]")
      end
    end
  end

  feature 'uploading photos' do
    let!(:user) { create :user }

    scenario 'by submitting form' do
      log_in
      visit '/photos'
      click_link 'Upload a photo'
      page.attach_file('Image', Rails.root + 'spec/factories/images/test.png')
      click_button 'Post'
      expect(current_path).to eq '/photos'
      expect(Photo.first.image_file_name).not_to be_empty
    end

    context 'user not logged in' do
      scenario 'does not let you upload photos when not logged in' do
        visit '/photos'
        click_link 'Upload a photo'
        expect(current_path).to eq '/users/sign_in'
        expect(page).to have_content "You need to sign in or sign up before "\
                                     "continuing."
      end
    end
  end
end 
