require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/fixtures/Brainslug.jpg')
    fill_in 'Caption', with: 'Me when I try to understand routes'
    click_button 'Create Post'
    expect(page).to have_content('Me when I try to understand routes')
  end
end
