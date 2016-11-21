require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/weebl.jpg")
    fill_in 'Caption', with: 'nom nom nom #pie'
    click_button 'Create Post'
    expect(page).to have_content('#pie')
    expect(page).to have_css("img[src*='weebl.jpg']")
  end
  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'nom nom nom #pie'
    click_button 'Create Post'
    expect(page).to have_content("Ooops. You forgot to attach an image.")
  end
end
