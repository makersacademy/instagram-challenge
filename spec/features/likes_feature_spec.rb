require 'rails_helper'

feature 'liking content' do

  before do
    sign_up
    upload_photo
    click_link('', href: "#{photo_path(Photo.last)}")
  end

  context 'photos' do
    scenario 'user can like a photo' do
      click_link 'Like Photo'
      expect(page).to have_content '1 like'
    end

    scenario 'user can only like a photo once' do
      click_link 'Like Photo'
      click_link 'Like Photo'
      expect(page).to have_content '1 like'
    end
  end
end
