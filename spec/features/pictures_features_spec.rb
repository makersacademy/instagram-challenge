feature 'Pictures' do
  context 'no pictures have been posted' do
    scenario 'should display a prompt to add a picture' do
      sign_up
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  # context 'pictures have been added' do
  #
  #   before do
  #     Picture.create(title: 'My cat is awesome')
  #   end
  #
  #   scenario 'display picture titles' do
  #     sign_up
  #     visit '/pictures'
  #     expect(page).to have_content('My cat is awesome')
  #     expect(page).not_to have_content('No pictures yet')
  #   end
  # end

  context 'creating pictures' do
    scenario 'prompts users to fill in a form and then displays their picture' do
      sign_up
      post_a_picture
      visit '/pictures'
      expect(page).to have_css("img[src*='cat.jpg']")
    end
  end

  context 'deleting pictures' do
    scenario 'clicking the delete link removes the picture' do
      sign_up
      post_a_picture
      visit '/pictures'
      click_link 'Delete picture'
      expect(page).not_to have_css("img[src*='cat.jpg']")
      expect(page).not_to have_content('My cat is awesome')
      expect(page).to have_content('Picture deleted successfully')
    end

    scenario 'user can not delete others pictures' do
      sign_up
      post_a_picture
      click_link 'Sign out'
      sign_up(email: 'another@user.com', username: 'Different')
      visit '/pictures'
      click_link 'Delete picture'
      expect(page).to have_content 'Sorry, you may only delete your own picture'
    end
  end

  context 'viewing pictures' do
    scenario 'User must be logged in to view pictures' do
      visit '/pictures'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
