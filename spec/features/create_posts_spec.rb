require 'rails_helper'

feature 'Post Creation' do
  scenario 'a post can be created' do
    newpost1
    expect(page).to have_content('Jack in the Fruit')
    expect(page).to have_css("img[src*='jackfruit.jpg']")
  end

  scenario 'a post requires an image' do
    visit '/'
    click_on 'New Post'
    fill_in 'Caption', with: 'Jack in the Fruit'
    click_on 'Create Post'
    expect(page).to have_content('Please add an Image')
  end
end
