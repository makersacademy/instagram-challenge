require 'rails_helper'

RSpec.feature "Photo Pages", type: :feature do
  scenario "User can see a link for a photo's comment page" do
    new_user
    post = Post.create(text: "Hello test!", photo: "pretend_photo.png", user_id: 1)
    visit "/posts"
    expect(page).to have_link("t h o u g h t s ?")
  end

  scenario "User can click a link to see a photo's comment page" do
    new_user
    post = Post.create(text: "Hello test!", photo: "pretend_photo.png", user_id: 1)
    visit "/posts"
    click_link "t h o u g h t s ?"
    expect(page).to have_content("Comments")
  end

end
