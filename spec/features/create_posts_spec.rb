require 'rails_helper.rb'

feature 'Creating new posts' do 
  scenario 'User can create a post' do 
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Username', with: 'ben'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/burger.jpg")
    fill_in 'Caption', with: 'meat and cheese and carbs'
    click_button 'Create Post'
    expect(page).to have_css("img[src*='burger.jpg']")
    expect(page).to have_content('meat and cheese and carbs')
  end

  scenario 'User must upload an image with their post' do 
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Username', with: 'ben'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Caption', with: 'meat and cheese and carbs'
    click_button 'Create Post'
    expect(page).not_to have_content('meat and cheese and carbs')
    expect(page).to have_content('You must upload an image!')
  end

end