require 'rails_helper'

feature 'liking pictures' do
  before do
    user = User.create email: 'kirsten@jones.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj'
    user.pictures.create(caption: 'Amazing friggin caption')
  end

  scenario 'a user who is signed in can like a picture, which updates the picture\'s like count' do
    visit '/pictures'
    click_button 'Like'
    expect(page).to have_content('1 like')
  end

end
