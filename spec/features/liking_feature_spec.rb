require 'rails_helper'

feature 'Likes' do

  before do
    sign_up(username: 'arukomp')
    create_photo
    sign_out
  end

  scenario 'must be logged in to like a photo' do
    visit '/arukomp'
    click_link 'Like', match: :first
    expect(current_path).to eq '/users/sign_in'
  end

  scenario 'user can like a photo' do
    sign_up(username: 'somebody', email: 'hello@test.com')
    visit '/arukomp'
    click_link 'Like', match: :first
    expect(page).to have_content '👍 1'
  end

  scenario 'user can only like a photo once' do
    sign_up(username: 'somebody', email: 'hello@test.com')
    visit '/arukomp'
    click_link 'Like', match: :first
    click_link 'Like', match: :first
    expect(page).to have_content '👍 1'
  end

end
