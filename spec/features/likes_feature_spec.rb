require 'rails_helper'

feature 'liking photos' do

  before do
    image = Photo.create(title: 'sunset.jpg')
  end

  scenario 'a user can like an image' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content ('1 like')
  end
end