require 'rails_helper'

feature 'liking pictures' do
  before do
    @user = create :user
    @user2 = create :user2
    @user.pictures.create(picture_file_name: 'associations')
    sign_in(@user)
  end
  scenario 'user can like a picture, which updates the like count' do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content '1 like'
  end

  scenario 'clicking like link twice results in "2 likes"' do
    visit '/pictures'
    click_link 'Like'
    click_link 'Sign out'
    sign_in(@user2)
    click_link 'Like'
    expect(page).to have_content '2 likes'
  end

  scenario 'user can only like a picture once' do
    visit '/pictures'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content '1 like'
  end

  context 'user not signed in' do
    scenario 'user cannot like a picture' do
      visit '/pictures'
      click_link 'Sign out'
      click_link 'Like'
      expect(page).to have_content '0 likes'
    end
  end

end
