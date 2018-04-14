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

  it 'requires an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Too shy to share a pic'
    click_button 'Create Post'
    expect(page).to have_content("Where's your beautiful picture?")
  end
end
