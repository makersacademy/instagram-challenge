require 'rails_helper'

feature 'likes' do
  let!(:user) { create(:user) }
  let!(:photo) { create(:photo_without_user, user_id: user.id) }
  before { sign_in_as(user) }

  scenario 'liking a photo' do
    visit('/')
    click_link('Testing')
    click_link('Like')
    expect(page).to have_content('1 like')
  end

  scenario 'unliking a photo' do
    visit('/')
    click_link('Testing')
    click_link('Like')
    expect(page).not_to have_link('/Like')
    click_link('Unlike')
    expect(page).to have_content('0 likes')
  end
end
