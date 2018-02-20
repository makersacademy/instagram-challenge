require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/images/1.jpeg')
    fill_in 'Description', with: 'Not Egypt #expensivegreenhouse'
    click_button 'Create Post'
    expect(page).to have_content('#expensivegreenhouse')
    expect(page).to have_css("img[src*='1.jpeg']")
  end
end
