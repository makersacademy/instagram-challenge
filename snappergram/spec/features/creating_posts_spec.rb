require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/robocop.jpg")
    fill_in 'Caption', with: 'Stay out of trouble #advice'
    click_button 'Create Post'
    expect(page).to have_content('#advice')
    expect(page).to have_css("img[src*='robocop.jpg']")
  end
end
