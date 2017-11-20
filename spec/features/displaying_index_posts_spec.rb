require 'rails_helper'
require 'web_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/foodart.jpg')
    fill_in 'Caption', with: 'post 1'
    click_button 'Create Post'
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/foodart.jpg')
    fill_in 'Caption', with: 'post 2'
    click_button 'Create Post'

    visit '/'
    expect(page).to have_content("post 1")
    expect(page).to have_content("post 2")
    expect(page).to have_css("img[src*='foodart']")
  end
end
