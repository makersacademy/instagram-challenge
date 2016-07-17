require 'rails_helper'

feature 'commenting' do
  before do
    visit '/'
    click_link 'New Post'
    attach_file 'Image', "spec/files/images/canada.jpg"
    fill_in 'Caption', with: 'Snowboarding in Canada #winter'
    click_button 'Create Post'
  end

  scenario 'add a comment to a post' do
    visit '/posts'
    click_link 'Comment'
    fill_in "Comment", with: 'Amazing'
    click_button 'Leave Comment'
    expect(page).to have_content 'Amazing'
  end
end
