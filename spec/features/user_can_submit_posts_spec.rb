require 'rails_helper'

RSpec.describe "creating a post", type: :feature do

  let!(:user) { create(:user) }
  let!(:post_1) { create(:post) }

  before do
    login(user)
  end

  scenario "I can see my created post on the posts page" do
    visit '/posts'
    expect(page).to have_content "hello world"
    expect(page).to have_css("img[src*='octocat']")
  end
end
