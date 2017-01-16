feature 'index' do
  context 'When a user visits the show photo page' do
    before do
      sign_in
      create_a_photo
      visit('/')
      click_link('testphoto')
    end

    scenario 'User may click edit link' do
      expect(page).to have_link('Edit')
    end
  end

  context 'When a user clicks the edit link' do
    before do
      sign_in
      create_a_photo
      visit('/')
      click_link('testphoto')
      click_link('Edit')
    end
    scenario 'User can see Edit Pin title' do
      expect(page).to have_content('Edit Photo')
    end

    scenario 'User can see update pin button' do
      expect(page).to have_button('Update')
    end

    scenario 'User can see the cancel button' do
      expect(page).to have_link('Cancel')
    end
  end
end
