feature 'post' do
  context 'no images have been posted' do

    before do
      user = create :user
      sign_in(user)
    end

    scenario 'ask user to upload an image' do
      visit posts_path
      expect(page).to have_content 'No Posts'
      expect(page).to have_content 'New Post'
    end

    scenario 'clicking upload image takes user to page to upload page' do
      visit posts_path
      click_link 'New Post'
      expect(current_path).to eq new_post_path
      expect(page).to have_button 'Upload'
    end
  end

  context 'viewing images' do
    scenario 'clicking an image to see it bigger' do
      image = create :post
      visit posts_path
      find("a.image#{image.id}").click
      expect(current_path).to eq post_path(image)
    end
  end

  context 'uploaded image' do
    scenario 'will see image on the page' do
      image = create :post
      visit posts_path
      expect(page).to have_css "img[src*='test.jpg']"
      expect(page).to have_xpath "//img[contains(@src, 'test.jpg')]"
    end
  end

  context 'delete image' do
    scenario 'user can delete their images' do
      image = create :post
      user = build :user
      sign_in(user)
      visit posts_path
      click_link "Delete"
      expect(page).not_to have_css "img[src*='test.jpg']"
    end

    scenario 'user cannot delete other people\'s images' do
      image = create :post
      user = build :user
      sign_in_user2
      visit posts_path
      expect(page).not_to have_content 'Delete'
    end
  end

  context 'no comments' do
    scenario 'logged in users can see comment option' do
      image = create :post
      user = build :user
      sign_in(user)
      visit posts_path
      find("a.image#{image.id}").click
      expect(page).to have_css 'form'
    end
  end

  context 'adding comments' do
    scenario 'logged in users can comment' do
      image = create :post
      user = build :user
      sign_in(user)
      visit posts_path
      find("a.image#{image.id}").click
      fill_in 'thoughts', with: 'Wow'
      click_button 'Submit'
      expect(page).to have_content 'Wow'
    end
  end
end
