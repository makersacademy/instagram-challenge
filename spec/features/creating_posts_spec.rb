require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/images/racebike.jpg")
    fill_in 'Caption', with: 'This is my race bike! #sport'
    click_button 'Create Post'
    expect(page).to have_content('#sport')
    expect(page).to have_css("img[src*='racebike.jpg']")
  end
end
