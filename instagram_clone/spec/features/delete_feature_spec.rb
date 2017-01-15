feature 'Delete' do
  context 'When a user visits the show photo page' do
    before do
      create_a_photo
      visit('/')
      click_link('testphoto')
    end

    scenario 'User may click Delete link' do
      expect(page).to have_link('Delete')
    end

  end
end
