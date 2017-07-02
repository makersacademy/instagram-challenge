require 'rails_helper'

RSpec.feature 'Like', type: :feature do
  scenario "Can like a post and see that it is liked" do
    user = User.create({email: "test@mail.com", password: "password"})
    post = Post.create(content: "Test Post", user_id: user.id)
    visit posts_url(as: user)
    within('.post-link'){
      click_link
    }
    click_on "Like"
    expect(page.find(" .like_button").value).to match("Unlike")
  end

  scenario "Can unlike a post after it was liked" do
    user = User.create({email: "test@mail.com", password: "password"})
    post = Post.create(content: "Test Post", user_id: user.id)
    visit posts_url(as: user)
    within('.post-link'){
      click_link
    }
    click_button "Like"
    click_button "Unlike"
    expect(page.find(" .like_button").value).to match("Like")
  end
end
