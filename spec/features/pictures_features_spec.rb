feature 'pictures' do
  context 'no pictures have been posted' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end
