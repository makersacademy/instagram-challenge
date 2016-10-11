require 'rails_helper.rb'

feature 'Creating new comments' do 
  background do 
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
    visit '/'
    click_link('Sign out')
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'tom@mail.com')
    fill_in('Username', with: 'Tom')
    fill_in('Password', with: 'testtest')
    click_button('Sign up')
  end
  scenario 'User can create a comment on post from another user' do 
    visit '/'
    fill_in 'Add a comment', with: 'I love this composition'
    click_button 'Comment'
    expect(page).to have_content('I love this composition')
  end
end
