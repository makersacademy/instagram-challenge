require "rails_helper"

RSpec.describe "comment", type: :feature do

  let!(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }

  before do
    login(user)
  end

  scenario "commenting on post" do
    visit("/posts")
    within "div#comment-form#{post.id}" do
      fill_in "comment_content", with: "hello"
      click_button "Submit"
    end
    expect(page).to have_css("div#comment#{post.id}", text: 'hello')
  end
end
