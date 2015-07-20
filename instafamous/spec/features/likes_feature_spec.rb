require 'rails_helper'

feature 'Likes' do
  before do
    @user = User.create(email: 'test@test.com', password: '123456789')
    visit('/')
    click_link('Sign in')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456789'
    click_button('Log in')

    visit('/')
    click_link('Add Picture')
    attach_file "Image", 'spec/features/uploads/nuggets.jpeg'
    fill_in 'Caption', with: 'My first photo'
    click_button('Create Picture')
  end
  scenario 'can add likes to pictures' do
    visit('/')
    expect(page).to have_content('0 likes')
    find("a.likes-link").click
    expect(page).to have_content('1 like')
    find("a.likes-link").click
    expect(page).to have_content('2 likes')
  end
end