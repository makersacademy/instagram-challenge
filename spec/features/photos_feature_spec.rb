require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'adding photos' do
    before do
      user = User.create email: 'test@test.com', password: '12345678', password_confirmation: '12345678'
      login_as user
    end

    scenario 'by a user who has signed in' do
        visit '/photos'
        click_link 'Add a photo'
        expect(current_path).to eq '/photos/new'
        attach_file 'Image', 'spec/testimages/cat.png'
        fill_in 'Caption', with: 'Kitty'
        click_button 'Create Photo'
        expect(page).to have_css('img[src*="cat.png"]')
        expect(page).not_to have_content 'No pictures yet'
      end
    end


end
