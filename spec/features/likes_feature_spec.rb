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

  scenario 'cannot like photo if not signed in' do
    click_link 'Sign Out'
    click_link('', href: "#{photo_path(Photo.last)}")
    click_link 'Like Photo'
    expect(page).not_to have_content '0 likes'
    expect(current_path).to eq '/users/sign_in'
  end
end
