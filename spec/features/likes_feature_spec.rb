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

    scenario 'a user can like a photo' do
      visit photos_path
      expect(page).to have_link 'Like'
    end
  end

end
