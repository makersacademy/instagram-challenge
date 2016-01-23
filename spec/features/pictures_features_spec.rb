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
      visit '/pictures'
      click_link 'Post a picture'
      fill_in 'Title', with: 'My cat is awesome'
      page.attach_file 'picture[image]', './spec/support/cat.jpg'
      click_button 'Post picture'
      visit '/pictures'
      expect(page).to have_css("img[src*='cat.jpg']")
    end
  end
end
