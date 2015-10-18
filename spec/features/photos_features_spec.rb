require 'rails_helper'

feature 'photos' do

  let(:user){ build :user }
  let(:user2){ build :user2 }

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'posting photos' do
    scenario 'sign-in users can post a photo' do
      visit '/photos'
      sign_up(user)
      click_link "Add a photo"
      fill_in 'Title', with: 'My cats'
      attach_file("photo[image]", "spec/assets/cats.jpg")
      click_button "Post photo"
      expect(page).to have_content "My cats"
    end

    scenario 'users must upload a photo in order to post' do
      visit '/photos'
      sign_up(user)
      click_link "Add a photo"
      fill_in 'Title', with: 'My cats'
      click_button "Post photo"
      expect(page).to have_content 'You must upload a photo to post'
    end

  end

  context 'viewing and deleting photos' do
    let!(:cat){Photo.create(title:'cat', image_file_name: 'spec/assets/cats.jpg')}

    scenario 'users can view a photo' do
      visit '/photos'
      click_link 'cat'
      expect(page).to have_content 'cat'
      expect(current_path).to eq "/photos/#{cat.id}"
    end

    scenario 'users can delete a photo they posted' do
      visit '/photos'
      sign_up(user)
      click_link 'Delete cat'
      expect(page).not_to have_content 'cat'
      expect(page).to have_content 'Photo deleted successfully'
    end

    # scenario "users cannot delete a photo they haven't posted" do
    #   visit '/photos'
    #   sign_up(user)
    #   click_link 'Delete cat'
    #   expect(page).not_to have_content 'cat'
    #   expect(page).to have_content 'Photo deleted successfully'
    # end

  end








end
