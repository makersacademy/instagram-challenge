require 'rails_helper'

feature 'Deleting posts' do 
  background do
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'tom@mail.com')
    fill_in('Username', with: 'Tom')
    fill_in('Password', with: 'testtest')
    click_button('Sign up')
    click_link 'New Post'
    attach_file('Image', "spec/files/images/burger.jpg")
    fill_in 'Caption', with: 'Nom nom delicious tacos'
    click_button 'Create Post'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Users can delete a post from the single view page' do
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted!')
    expect(page).to_not have_content('Nom nom delicious tacos') 
  end
end

