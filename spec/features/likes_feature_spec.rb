require 'rails_helper'

feature 'Likes' do

  before do
    myface = Image.create(description: 'My face')
  end

  scenario 'an image initializes with zero likes' do
    visit '/'
    expect(page).to have_content('0 likes')
  end

  scenario 'there is a like button' do
    visit '/'
    expect(page).to have_link 'Like'
  end

  scenario 'a user can like an image, which updates the image likes count' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
