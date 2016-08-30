require 'rails_helper'

feature 'Editing posts' do

  background do
    user = create(:user)
    post = create(:post, caption: "This is my original post.")
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'jillygates@outlook.com'
    fill_in 'Password', with: 'dotcom'
    click_button 'Log in'
    find("a[href='#{post_path(post)}']").click
    expect(page.current_path).to eq(post_path(post))
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "This is my edited caption."
    click_button 'Update Post'
    expect(page).to have_content("This is my edited caption.")
  end

  it "won't update a post without an image" do
  attach_file('Image', 'spec/files/images/cat.zip')
  click_button 'Update Post'
  expect(page).to have_content("Update failed. Please check the form.")
  end
  
end
