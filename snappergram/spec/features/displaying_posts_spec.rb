require 'rails_helper'

feature 'index displays a list of posts' do
  background do
    visit "/users/sign_up"
    fill_in "User name", with: "Gulliver"
    fill_in "Email", with: "gulliver@mail.com"
    fill_in 'user_password', with: "travels"
    fill_in 'user_password_confirmation', with: "travels"
    click_button "Sign up"
  end

  scenario 'index displays the correct information for each post' do
      post1 = create(:post, caption: "Post one", user_id: 1)
      post2 = create(:post, caption: "Post two", user_id: 1)

      visit '/'
      expect(page).to have_content("Post one")
      expect(page).to have_content("Post two")
      expect(page).to have_css("img[src*='robocop']")
  end
end
