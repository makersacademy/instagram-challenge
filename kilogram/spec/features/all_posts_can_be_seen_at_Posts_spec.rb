require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'all posts can be seen at /posts' do
    visit '/posts/new'
    fill_in 'Pictureurl', with: 'www.google.it'
    fill_in 'Text', with: 'italian google'
    click_button 'Save Post'
    visit '/posts/new'
    fill_in 'Pictureurl', with: 'www.google.fr'
    fill_in 'Text', with: 'french google'
    click_button 'Save Post'
    visit '/posts'
    expect(page).to have_content("All posts\nPicture URL Text www.google.it italian google Show www.google.fr french google Show")
  end
end