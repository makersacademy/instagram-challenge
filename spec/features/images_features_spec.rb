require 'rails_helper'

feature 'Images' do

  context 'none have been uploaded' do
    scenario 'should let the user know there are no images' do
      visit '/images'
      expect(page).to have_content 'No images yet'
    end
  end

  context 'creating images' do

    let!(:user) { FactoryGirl.create(:user) }

    scenario 'is not allowed for users who are not logged in' do
      visit '/images'
      click_link 'Add Image'
      expect(current_url).to have_content '/users/sign_in'
    end

    scenario "allows creation" do
      login_as(user, :scope => :user)
      visit '/images'
      click_link 'Add Image'
      fill_in 'Description', with: 'Anything'
      attach_file 'Picture', 'app/assets/images/fatty.jpg'
      click_button 'Create Image'
      expect(page).to have_selector 'img[src*="fatty.jpg"]'
    end
  end

end
