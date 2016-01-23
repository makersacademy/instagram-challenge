feature 'pictures' do
  context 'no pictures have been posted' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do

    before do
      Picture.create(title: 'My can is awesome')
    end

    scenario 'display picture titles' do
      visit '/pictures'
      expect(page).to have_content('My cat is awesome')
      expect(page).not_to have_content('No pictures yet')
    end
  end
end
