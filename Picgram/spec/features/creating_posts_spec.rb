require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image','spec/files/images/messier.jpg')
    fill_in 'caption', with: 'messier marathon #astronomy'
    click_button 'Post'
    expect(page).to have_content('#astronomy')
    expect(page).to have_css("img[src*='messier.jpg']")
  end
end
