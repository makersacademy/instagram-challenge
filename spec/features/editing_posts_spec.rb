require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)
    user = create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'mr_deadpool@marvel.com'
    fill_in 'Password', with: 'chimichanga'
    click_button 'Log in'
    
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'user can edit a post' do
    fill_in 'Caption', with: 'Oh, sh*t i forgot to add a caption!'
    click_button 'Update Post'
    expect(page).to have_content 'Post updated!'
    expect(page).to have_content 'Oh, sh*t i forgot to add a caption!'

  end

  scenario "user can't edit without a photo" do
    attach_file('Image', 'spec/files/images/cat.jpg')
    fill_in 'Caption', with: 'Oh, sh*t i forgot to add a caption!'
    click_button 'Update Post'
    expect(page).to have_content 'Post updated!'
    expect(page).to have_content 'Oh, sh*t i forgot to add a caption!'
  end

  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/cat.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end
end
