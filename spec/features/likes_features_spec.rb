require 'rails_helper'

feature 'Liking pictures' do
  context 'when liking a picture' do
    before do
      sign_up('Tudor', 'test@email.com', '123456')
      add_picture
    end
    scenario 'it should increase a Like count' do
      click_link 'Like'
      expect(page).to have_content '1 Like'
    end
    scenario 'it should only allow 1 like per picture' do
      click_link 'Like'
      click_link 'Like'
      expect(page).to have_content 'You can give a maxium of 1 Like to a picture.'
    end
  end
end
