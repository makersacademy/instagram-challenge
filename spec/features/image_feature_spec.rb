feature 'Images' do
  let!(:test_user) {User.create email: DEFAULT_MAIL, password: DEFAULT_PASSWORD}

  context 'visiting the main page with no images added yet' do

    before :each do
      visit images_path
    end

    scenario 'should show there are no images' do
      expect(page).to have_content 'No Images Yet'
    end

    scenario 'should not show the add image link' do
      expect(page).not_to have_link 'Add new image'
    end

  end

  context 'visiting the main page with images present' do
    let!(:test_image_1) {Image.create title: DEFAULT_TITLE, user_id: test_user.id}
    let!(:test_image_2) {Image.create title: DEFAULT_TITLE_2, user_id: test_user.id}

    before :each do
      visit images_path
    end

    scenario 'show the image title' do
      expect(page).to have_content test_image_1.title
    end

    scenario 'show the image owner' do
      expect(page).to have_content test_image_1.user.email
    end

    scenario 'show the images in reverse chronological order' do
      expect(DEFAULT_TITLE_2).to appear_before DEFAULT_TITLE
    end

  end

  context 'adding a new image' do

    before :each do
      helper_sign_in
    end

    scenario 'should prompt to add a new image' do
      expect(page).to have_link 'Add new image'
    end

    scenario 'should let the user choose a title, then display the entry on the main page' do
      helper_add_image
      expect(current_path).to eq images_path
      expect(page).to have_content DEFAULT_TITLE
    end

  end

  context 'visualizing an image' do
    let!(:test_image_1) {Image.create title: DEFAULT_TITLE, user_id: test_user.id}

    before :each do
      helper_sign_in
      click_link test_image_1.title

    end

    scenario 'clicking an image leads a user to the images#show route' do
      expect(current_path).to eq image_path test_image_1.id
    end

    scenario 'page has the image, a link to go back, and the title' do
      expect(page).to have_content test_image_1.title
      expect(page).to have_link 'Go back to the Main Page'
    end

  end

end
