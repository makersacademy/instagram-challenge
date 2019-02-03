require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "files/images/goldblumdog.jpg")
    fill_in 'Caption', with: 'Goldblum dog'
    click_button 'Create Post'
    expect(page).to have_content('Goldblum dog')
    expect(page).to have_css("img[src*='goldblumdog.jpg']")
  end
end
