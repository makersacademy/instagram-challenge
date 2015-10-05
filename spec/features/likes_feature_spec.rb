require 'rails_helper'

feature 'like-ing photos' do

  before do
    user = create(:user)
    sign_in(user)
    visit photos_path
    click_link 'Upload Photo'
    attach_file('photo[picture]', 'spec/images/dimensions.png')
    click_button 'Create Photo'
  end

  context 'user is logged in' do

    scenario 'photos start with 0 likes as default' do
      visit photos_path
      expect(page).to have_content '0 likes'
    end

    scenario 'a user can like a photo, which updates the likes count' do
      visit photos_path
      click_link 'Like'
      expect(page).to have_content('1 like')
    end
  end

end
