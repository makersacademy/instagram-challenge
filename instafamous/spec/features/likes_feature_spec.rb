require 'rails_helper'

feature 'Likes' do
  before do
    Picture.create(caption: 'Photo 1')
  end
  scenario 'can add likes to pictures' do
    visit('/')
    expect(page).to have_content('0 likes')
    click_button('likes')
    expect(page).to have_content('1 like')
    click_button('likes')
    expect(page).to have_content('2 likes')
  end
end