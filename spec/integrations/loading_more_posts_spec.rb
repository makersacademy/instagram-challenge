require 'rails_helper'

feature 'AJAX - Displaying a list of posts' do
  background do
    user = create :user
    first_post = create(:post, caption: 'This is the first post', user_id: user.id)
    second_post = create(:post, caption: 'This is the second post', user_id: user.id)
    third_post = create(:post, caption: 'This is the third post', user_id: user.id)
    fourth_post = create(:post, caption: 'This is the fourth post', user_id: user.id)
    fifth_post = create(:post, caption: 'This is the fifth post', user_id: user.id)

    sign_in_with user
  end

  scenario 'index displays posts on following page', js: true do
    find(:xpath, "//a[contains(@href,'/?page=2')]").click
    expect(page).to have_content("This is the fourth post")
    expect(page).to have_content("This is the fifth post")
    expect(page).to have_css("img[src*='Brainslug']")
  end
end
