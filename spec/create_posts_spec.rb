require 'rails_helper.rb'

feature 'Creating new posts' do 
  scenario 'User can create a post' do 
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/burger.jpg")
    fill_in 'Caption', with: 'meat and cheese and carbs'
    click_button 'Create Post'
    expect(page).to have_css("img[src*='burger.jpg']")
    expect(page).to have_content('meat and cheese and carbs')
  end
end