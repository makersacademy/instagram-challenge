feature 'pictures' do
  context 'no pictures have been posted' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been added' do

    before do
      Picture.create(title: 'My cat is awesome')
    end

    scenario 'display picture titles' do
      visit '/pictures'
      expect(page).to have_content('My cat is awesome')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating pictures' do
    scenario 'prompts users to fill in a form and then displays their picture' do
      post_a_picture
      visit '/pictures'
      expect(page).to have_css("img[src*='cat.jpg']")
    end
  end

  context 'deleting pictures' do
    scenario 'clicking the delete link removes the picture' do
      post_a_picture
      visit '/pictures'
      click_link 'Delete picture'
      expect(page).not_to have_css("img[src*='cat.jpg']")
      expect(page).not_to have_content('My cat is awesome')
      expect(page).to have_content('Picture deleted successfully')
    end

  end
end
