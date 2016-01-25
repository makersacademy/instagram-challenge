require 'rails_helper'

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
      let!(:photo) { FactoryGirl.create :test_photo, :first }
      let!(:second_photo) { FactoryGirl.create :test_photo, :second }

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

    scenario 'by submitting form' do
      user = FactoryGirl.create :user
      login_as user
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

  feature 'deleteing photos' do
    
    context 'user logged in' do
      scenario 'can delete their own post' do
        user = FactoryGirl.create :user
        login_as user
        new_photo = FactoryGirl.create :test_photo, user: user
        p new_photo
        visit '/photos'
        click_link 'Delete photo'
        expect(current_path).to eq photos_path
        expect(page).to have_content 'Photo deleted successfully'
        expect(page).to_not have_xpath("//img[contains(@src, \'thumb/test.png\')]")
      end

      scenario 'should not see a delete link for someone elses photo' do
        user2 = FactoryGirl.create :user2
        login_as user2
        visit '/photos'
        expect(page).not_to have_link 'Delete photo'
      end
    end

    scenario 'cannot delete any photos if not logged in' do
      visit '/photos'
      expect(page).not_to have_link 'Delete photo'
    end
  end
end 
