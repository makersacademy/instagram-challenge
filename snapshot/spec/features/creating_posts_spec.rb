feature 'creating posts' do
  context 'no posts yet' do
    it 'has a New Post button' do
      visit '/posts'
      expect(page).to have_content 'OMG, there are no photos yet!'
      expect(page).to have_link 'New Post'
    end
  end

    scenario 'can create a post' do
      visit '/posts'
      click_link 'New Post'
      attach_file('Image', "spec/images/NPG.jpg")
      fill_in 'Caption', with: 'Lovely lovely art #nationalportraitgallery'
      click_button 'Create Post'
      expect(page).to have_content('#nationalportraitgallery')
      expect(page).to have_css("img[src*='NPG.jpg']")
    end

    it 'needs an image to create a post' do
      visit '/posts/new'
      fill_in 'Caption', with: 'Lovely lovely art #nationalportraitgallery'
      click_button 'Create Post'
      # expect(post).to have(1).error_on(:image)
      expect(page).to have_content "Image can't be blank"
  end
end
