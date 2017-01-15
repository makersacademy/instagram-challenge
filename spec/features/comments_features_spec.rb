require 'rails_helper'

feature 'Comments' do
  context 'Adding comments' do
    before do
      sign_up('Tudor', 'test@email.com', '123456')
    end
    scenario 'it should add a new comment to a picture' do
      click_link 'Add comment'
      fill_in 'Description', with: 'How cool is this web app!'
      click_link 'Create comment'
      expect(page).to have_content 'How cool is this web app!'
    end
  end
end
