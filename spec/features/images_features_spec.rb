require 'rails_helper'

feature 'Images' do

  let!(:user) { FactoryGirl.create(:user) }

  context 'none have been uploaded' do
    scenario 'should let the user know there are no images' do
      visit '/images'
      expect(page).to have_content 'No images yet'
    end
  end

  context 'creating images' do

    scenario 'is not allowed for users who are not logged in' do
      visit '/images'
      click_link 'Add Image'
      expect(current_url).to have_content '/users/sign_in'
    end

    scenario "is allowed for users who are logged in" do
      login_as(user, :scope => :user)
      visit '/images'
      click_link 'Add Image'
      fill_in 'Description', with: 'Anything'
      attach_file 'Picture', 'app/assets/images/fatty.jpg'
      click_button 'Create Image'
      expect(page).to have_selector 'img[src*="fatty.jpg"]'
    end

    scenario 'is not allowed if a description is not given' do
      login_as(user, :scope => :user)
      visit '/images'
      click_link 'Add Image'
      attach_file 'Picture', 'app/assets/images/fatty.jpg'
      click_button 'Create Image'
      expect(current_url).to have_content '/images/new'
      expect(page).to have_content 'You need to add a description'
    end
  end

  context 'viewing images' do

    let!(:image){ FactoryGirl.create(:image, user_id: user.id) }

    scenario 'images can be viewed individually' do
      visit '/images'
      find("a:nth-of-type(3)").click
      expect(page).to have_content image.description
      expect(page).to have_selector 'img[src*="fatty.jpg"]'
    end

    scenario 'a user can like an image' do
      login_as(user, :scope => :user)
      visit "/images/#{image.id}"
      find("p a").click
      # expect{ find("p a").click }.to change{ image.likes }.by(1)
      expect(page).to have_content '1'
    end
  end

end
