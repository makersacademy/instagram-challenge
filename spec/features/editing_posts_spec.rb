require 'rails_helper'

feature 'Editing posts' do  
  background do
    user = create :user
    user_2 = create(:user, email: "test2@gmail.com", user_name: 'user_two', id: user.id + 1)
    post = create(:post, user: user)
    post_2 = create(:post, user: user_2)
    visit '/'
    signin
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "You weren't meant to see this picture!"
    click_button 'Update Post'
    expect(page).to have_content("Post updated.")
    expect(page).to have_content("You weren't meant to see this picture!")
  end
end
