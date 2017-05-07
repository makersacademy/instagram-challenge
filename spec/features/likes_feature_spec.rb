require 'rails_helper'

feature 'liking content' do

  before do
    sign_up
    upload_photo
  end

  context 'photos' do
    scenario 'user can like a photo' do
      click_link 'Avocado and Scrambled eggs #Living'
      click_link 'Like Photo'
      expect(page).to have_content '1 like'
    end
  end
end
