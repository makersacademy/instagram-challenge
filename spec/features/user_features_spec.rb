require 'rails_helper'

RSpec.feature "Create a post", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New Post"
    fill_in "post[title]", with: "Test!"
    click_button "Create Post"
    expect(page).to have_content("Test!")
  end
end

RSpec.feature "Show individual posts", type: :feature do
  scenario "Can see individual posts" do
    visit "/posts"
    click_link "New Post"
    fill_in "post[body]", with: "Test!"
    click_button "Create Post"
    click_link "Show"
    expect(page).to have_content("Test!")
  end
end

# New failing feature test:
# RSpec.feature "Comment", type: :feature do
#   scenario "Can comment posts" do
#     visit "/posts"
#     click_link "Comment"
#     fill_in "post[comment]", with: "Test!"
#     clck_button "Update Post"
#     expect(page).to have_content("Test!")
#   end
# end

# New failing feature test:
# RSpec.feature "Like the post", type: :feature do
#   scenario "Can see individual posts" do
#     visit "/posts"
#     click_link "New Post"
#     fill_in "post[body]", with: "Test!"
#     click_button "Create Post"
#     click_link "Like"
#     expect(page).to have_content("Like 1")
#   end
# end
