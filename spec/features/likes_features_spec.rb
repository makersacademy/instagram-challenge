require 'rails_helper'

feature 'liking pictures' do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end
  before do
    holiday = Picture.create(name: 'Holiday')
    holiday.comments.create(comment: 'It looks nice')
  end

  scenario 'a user can like a picture, which updates the picture like count', js: true do
    visit '/pictures'
    click_link 'Like Picture'
    expect(page).to have_content('1 like')
  end

end