require 'rails_helper'

feature 'liking pictures' do

  before do
    picture = Picture.create(name: 'test')
  end

  scenario 'a user can like a picture which updates the like counter', js: true do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
