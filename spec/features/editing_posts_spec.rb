require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end
  
  scenario 'user can edit a post' do
    fill_in 'Caption', with: 'Oh, sh*t i forgot to add a caption!'
    click_button 'Update Post'
    expect(page).to have_content 'Post updated!'
    expect(page).to have_content 'Oh, sh*t i forgot to add a caption!'

  end
end
