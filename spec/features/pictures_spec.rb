feature 'Pictures' do
  context 'no images have been added' do
    it "has a link to add photos" do
      visit images_path
      expect(page).to have_link "Add photos"
    end
  end

  context 'Adding photos' do
    it "images can be added" do
      visit images_path
      click_link "Add photos"
      fill_in :Title, with: "Beautiful Sunset"
      attach_file :Image, 'public/test/image.jpg'
      click_button 'Create Image'
      expect(current_path).to eq images_path
      expect(page).to have_content "Beautiful Sunset"
      expect(page).to have_css "img[alt='Image']"
    end
  end
end
