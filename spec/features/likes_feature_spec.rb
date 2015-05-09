require 'rails_helper'

feature 'Likes' do

  before do
    sign_up_and_sign_in
    create_an_image
    visit '/'
  end

  scenario 'an image initializes with zero likes' do
    expect(page).to have_content('0 likes')
  end

  scenario 'there is a like button' do
    expect(page).to have_link 'Like'
  end

  scenario 'a user can like an image, which updates the image likes count' do
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a user cannot like an image more than once' do
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
