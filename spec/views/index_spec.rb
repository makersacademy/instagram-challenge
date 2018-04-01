require 'rails_helper'

feature 'user can add a picture and then see it on the index page' do
  scenario 'User visits index and clicks on the camera icon and fills in the form' do
    visit '/'
    click_link('')
    attach_file('post_image', '/Users/JoshuaHolloway/Pictures/ocean_reflection-wide.jpg')
    fill_in('post_title', with: 'Definitely not Josh')
    click_button 'Create Post'
    expect(page).to have_content 'Definitely not Josh'
  end
end