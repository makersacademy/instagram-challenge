require 'rails_helper'

feature 'Editing posts' do
  background do
    visit "/users/sign_up"
    fill_in "User name", with: "Gulliver"
    fill_in "Email", with: "gulliver@mail.com"
    fill_in 'user_password', with: "travels"
    fill_in 'user_password_confirmation', with: "travels"
    click_button "Sign up"
    create(:post, user_id: 1)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link('Edit Post')
  end

  scenario 'user can edit post' do
    fill_in 'Caption', with: "This post has been edited"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("This post has been edited")
  end


end
