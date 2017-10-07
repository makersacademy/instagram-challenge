require 'rails_helper'

feature "viewing profile page" do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  scenario "user signs up and views profile" do
    sign_up
    click_link "My profile"
    expect(page).to have_content('testing')
    expect(page).to have_content("Test bio")
  end

  scenario "user can view other people's profiles" do
    sign_up
    visit "/posts"
    click_on "#{post.user.username}"
    expect(current_path).to eq user_path(post.user)
  end
end
