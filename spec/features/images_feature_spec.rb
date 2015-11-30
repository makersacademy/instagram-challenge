feature 'images' do
  context 'no images have been added' do
    scenario 'should prompt user to add an image' do
      visit '/'
      expect(page).to have_content 'No images have been added yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do
    let!(:my_image){Image.create(file: open("golf.jpg"), title: 'My Image')}

    scenario 'display images that have been added, along with their titles' do
      visit '/'
      expect(page).to have_content 'My Image'
      expect(page).to have_css("img[src*='golf.jpg']")
    end

    scenario 'viewing an individual image' do
      visit '/'
      click_link('My Image')
      expect(page).to have_css("img[src*='golf.jpg']")
      expect(current_path).to eq "/images/#{my_image.id}"
    end

    scenario 'allows user to delete an image' do
      visit '/'
      click_link 'Delete My Image'
      expect(page).not_to have_content 'My Image'
      expect(page).not_to have_css("img[src*='golf.jpg']")
    end
  end
end
