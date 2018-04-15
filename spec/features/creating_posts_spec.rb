require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'User can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/nottingham.jpg")
    fill_in 'Caption', with: 'Ye Olde Jerusalem #Nottingham #oldestpub #couple'
    click_button 'Create Post'
    expect(page).to have_content('#Nottingham')
    expect(page).to have_css("img[src*='nottingham.jpg']")
  end
end
