require 'rails_helper'

feature 'Editing existing posts' do 
  background do 
    user = create :user 
    user2 = create(:user, email: 'ben@mail.com',
                          user_name: 'Ben',
                          id: user.id + 1)
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'tom@mail.com')
    fill_in('Username', with: 'Tom')
    fill_in('Password', with: 'testtest')
    click_button('Sign up')
    click_link 'New Post'
    attach_file('Image', "spec/files/images/burger.jpg")
    fill_in 'Caption', with: 'meat and cheese and carbs'
    click_button 'Create Post'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Users can edit existing posts' do 
    fill_in 'Caption', with: 'I made a mistake'
    click_button 'Update Post'
    expect(page).to have_content("Post updated!")
    expect(page).to have_content("I made a mistake")
    expect(page).not_to have_content("This post is flawless")
  end
end