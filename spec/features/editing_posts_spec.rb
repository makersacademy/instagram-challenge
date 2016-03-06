require 'spec_helper'

feature 'Can edit individual posts' do
  background do
    job = create(:post)
    visit '/'
  end

  scenario 'can click and view a single post' do
    find(:xpath, "//a[contains(@href,'posts/4')]").click
    click_link 'Edit Post'
    fill_in 'Caption', with: 'Comment has been edited'
    click_button 'Update Post'
    expect(page).to have_content 'Post was updated'
    expect(page).to have_content 'Comment has been edited'
  end

  scenario 'user will get a message if updating without an image' do
    find(:xpath, "//a[contains(@href,'posts/5')]").click
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content("Something is wrong with your form!")
  end
end

feature 'Delete existing posts' do
  scenario 'user can delete an existing post' do
    post = create(:post, caption: 'I am superman!')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/6')]").click
    click_link 'Delete Post'
    expect(current_path).to eq '/posts'
    expect(page).to have_content("Post was deleted")
    expect(page).to_not have_content("I am superman!")
  end
end