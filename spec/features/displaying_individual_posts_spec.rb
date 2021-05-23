require 'rails_helper'

feature 'Posting to the feed more than once' do
  scenario 'a user can post a picture to the feed and see multiple posts' do
    visit '/'
    click_link 'New post'
    attach_file('post[picture]', "spec/files/images/cat.jpeg")
    fill_in 'Caption', with: 'My favourite cat'
    click_button 'Create Post'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq('/posts/1')
  end
end 
