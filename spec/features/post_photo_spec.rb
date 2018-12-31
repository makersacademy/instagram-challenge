require 'rails_helper'

RSpec.feature "Post photo", type: :feature do
  scenario "User can post photo if signed in" do
    user = FactoryBot.create(:user)
    sign_in(user)
    expect(current_path).to eq "/posts"
    post_photo
    expect(current_path).to eq "/posts"
    expect(page).to have_content "This is my photo caption JoeyB"
  end

  scenario "User unable to post photo unless signed in" do
    visit "/posts"
    expect(page).not_to have_link "New Post"
  end
end
