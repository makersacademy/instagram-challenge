require 'rails_helper'

feature 'posts' do

  background do
    user = create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'jillygates@outlook.com'
    fill_in 'Password', with: 'dotcom'
    click_button 'Log in'
  end

  scenario "Index page should display 'New Post' when the user is signed in" do
    expect(page).to have_content 'Picturegram'
    expect(page).to have_link 'New Post'
  end

  scenario 'can create a post' do
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/cat.jpg')
    fill_in 'Caption', with: 'This is a cat!'
    click_button 'Create Post'
    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content('This is a cat!')
    expect(page).to have_css("img[src*='cat.jpg']")
  end

  it 'needs an image to create a post' do
    click_link 'New Post'
    fill_in 'Caption', with: "No picture because YOLO"
    click_button 'Create Post'
    expect(page).to have_content("Your new post couldn't be created! Please check the form.")
  end

end


feature 'Not allowed to post' do

  scenario 'user cannot post if he/she is not signed in' do
    visit '/'
    expect(page).to_not have_content('New Post')
  end

  scenario 'User cannot create a new post without logging in' do
      visit new_post_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
