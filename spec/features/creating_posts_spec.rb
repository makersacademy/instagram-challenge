require 'rails_helper'

feature 'Creating Posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'great view!'
    expect(page).to have_content('great view!')
    expect(page).to have_css("img[src*='scenery.jpg']")
  end
end
