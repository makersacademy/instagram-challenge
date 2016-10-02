require 'rails_helper'

feature 'Comments' do
  background do
    post = create(:post)
  end

  xscenario 'allows users to leave a comments using a form' do
     visit '/'
     find(:xpath, "//a[contains(@href, 'posts/#{post.id}')]").click
     fill_in "Comment", with: "Looking good!"
     click_button 'Post Comment'
     expect(current_path).to eq '/#{post.id}'
     expect(page).to have_content "Looking good!"
  end

end
