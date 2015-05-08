require 'rails_helper'

feature 'liking photos' do
before do
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

  before do
    pic1 = Picture.create(title: 'Pic 1')
    pic1.comments.create(thoughts: 'It was an abomination')
  end

  it 'a user can like a picture, which updates the like picture count', js: true do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
