require 'rails_helper'

feature 'Displaying posts works' do
  background do
    user = create(:user)
    post_one = create(:post, caption: "My first post")
    post_two = create(:post, caption: "And my second")
    sign_in_with user
  end

  scenario 'via index on the homepage.' do
    expect(page).to have_content("My first post")
    expect(page).to have_content("And my second")
    expect(page).to have_css("img[src*='sample_02']")
  end
end
