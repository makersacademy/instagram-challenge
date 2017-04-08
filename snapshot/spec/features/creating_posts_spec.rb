feature 'creating posts' do
  context 'no posts yet' do
    scenario 'should display a prompt to add a new post' do
      visit '/posts'
      expect(page).to have_content 'OMG, there are no photos yet!'
      expect(page).to have_link 'New Post'
    end
  end

    scenario 'can create a post' do
      visit '/posts'
      click_link 'New Post'
      # click_link 'Choose File'
      attach_file('Image', "spec/images/NPG.jpg")
      fill_in 'Caption', with: 'Lovely lovely art #nationalportraitgallery'
      click_button 'Create Post'
      expect(page).to have_content('#nationalportraitgallery')
      expect(page).to have_css("img[src*='NPG.jpg']")
    end
end
