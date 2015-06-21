require 'rails_helper'

feature 'Likes' do
  before do
    @user = User.create(email: 'test@test.com', password: '123456789')
    @user.pictures.create(caption: 'Photo 1')
  end
  xscenario 'can add likes to pictures' do
    visit('/')
    expect(page).to have_content('0 likes')
    find('.likes-count').click
    expect(page).to have_content('1 like')
    find('.likes-count').click
    expect(page).to have_content('2 likes')
  end
end