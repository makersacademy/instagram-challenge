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
      add_post
      expect(page).to have_content('#nationalportraitgallery')
      expect(page).to have_css("img[src*='NPG.jpg']")
    end

    it 'needs an image to create a post' do
      visit '/posts/new'
      fill_in 'Caption', with: 'Lovely lovely art #nationalportraitgallery'
      click_button 'Create Post'
      expect(page).to have_content "Image can't be blank"
  end
end
