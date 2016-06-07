require 'rails_helper'

feature 'Viewing a list of posts' do  
  scenario 'the index displays previously created posts' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Username', with: 'ben'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/burger.jpg")
    fill_in 'Caption', with: 'This is a post'
    click_button 'Create Post'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/burger.jpg")
    fill_in 'Caption', with: 'This is another post'
    click_button 'Create Post'
    expect(page).to have_content("This is a post")
    expect(page).to have_content("This is another post")
    expect(page).to have_css("img[src*='burger']")
  end
end

feature 'Viewing individual post' do 
  scenario 'the user can navigate to an individual post' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Username', with: 'ben'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/burger.jpg")
    fill_in 'Caption', with: 'I like tacos'
    click_button 'Create Post'
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(1))
    expect(page).to have_content("I like tacos")
  end
end