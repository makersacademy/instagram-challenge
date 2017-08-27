require 'rails_helper'

RSpec.describe "creating a post", type: :feature do

  let!(:user) { create(:user) }
  let!(:post) { create(:post, caption: "a new post") }

  before do
    login(user)
  end

  scenario "I can see my created post on the posts page" do
    visit post_path(post)
    expect(page).to have_content "a new post"
    expect(page).to have_css("img[src*='octocat']")
  end
end
