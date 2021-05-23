require 'rails_helper'

feature 'Posting to the feed more than once' do
  scenario 'a user can post a picture to the feed and see multiple posts' do
    post = create(:post, caption: "My favourite cat")
    
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq('/posts/1')
  end
end 
