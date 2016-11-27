require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet :('
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'user can add pictures' do
    scenario 'needs an image to post' do
      sign_up_sign_in
      visit '/'
      click_link 'Post a picture'
      click_button 'Create Picture'
      expect(page).to have_content("You need to have an image to post!!")
    end
    scenario 'must be signed in to post' do
      visit '/'
      click_link 'Post a picture'
      expect(page).to have_content("You need to have an image to post!!")
    end
    scenario 'pictures can be added' do
      sign_up_sign_in
      visit '/'
      click_link 'Post a picture'
      attach_file "Image", "spec/files/pictures/picture.jpg"
      fill_in 'Caption', with: 'This is a test caption'
      click_button 'Create Picture'
      expect(page).to have_css("img[alt*='Picture']")
      expect(page).to have_content("This is a test caption")
    end
  end

  context 'pictures have been added' do
    before do
      @user = create(:user)
      @picture = attach_file "Image", "spec/files/pictures/picture.jpg"
    end
    scenario 'displays the pictures' do
      visit '/'
      expect(page).to have_content("This is a caption")
      expect(page).to have_css("img[src*='picture']")
    end
    scenario 'Can click and view a single post' do
      visit '/'
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      expect(page.current_path).to eq(picture_path(@picture))
      expect(page).to have_content("This is a caption")
      expect(page).to have_css("img[src*='picture']")
    end
    scenario 'user can edit their picture caption' do
      sign_in
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      click_link 'Edit Caption'
      fill_in 'picture_caption', with: 'Now we have a new caption'
      click_button 'Update Picture'
      expect(page).to have_content('Now we have a new caption')
    end
    scenario 'user can delete a photo' do
      sign_in
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      click_link 'Delete Picture'
      expect(page).to have_content('Picture has been deleted')
      expect(page).not_to have_css("img[src*='picture']")
    end
    scenario 'user can not edit or delete a photo they do not own' do
      sign_up_sign_in
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      expect(page).not_to have_content('Edit Caption')
      expect(page).not_to have_content('Delete Picture')
    end
  end
end
