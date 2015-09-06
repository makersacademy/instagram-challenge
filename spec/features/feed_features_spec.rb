feature 'feeds' do
  context 'no images have been posted' do

    before do
      user = create :user
      sign_in(user)
    end

    scenario 'ask user to upload an image' do
      visit root_path
      expect(page).to have_content 'No Images'
      expect(page).to have_content 'Upload Image'
    end

    scenario 'clicking upload image takes user to page to upload page' do
      visit root_path
      click_link 'Upload Image'
      expect(current_path).to eq new_feeds_path
      expect(page).to have_button 'Upload'
    end
  end

  context 'uploaded image' do
    scenario 'will see image on the page' do
      image = create :image
      visit root_path
      expect(page).to have_css "img[src*='test.png']"
      expect(page).to have_xpath "//img[contains(@src, 'test.png')]"
    end
  end

  context 'delete image' do
    scenario 'user can delete their images' do
      image = create :image
      user = build :user
      sign_in(user)
      visit root_path
      expect(page).to have_link "Delete"
    end
  end
end
