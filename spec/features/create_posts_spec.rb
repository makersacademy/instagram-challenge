require 'rails_helper'

feature 'Post Creation' do
  scenario 'a post can be created' do
    visit '/'
    click_on 'New Post'
    attach_file('Image', "spec/files/images/jackfruit.jpg")
    fill_in 'Caption', with: 'Jack in the Fruit'
    click_on 'Create Post'
    expect(page).to have_content('Jack in the Fruit')
    expect(page).to have_css("img[src*='jackfruit.jpg']")
  end
end
