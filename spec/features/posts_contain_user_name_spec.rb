require "rails_helper"


RSpec.feature 'Post', type: :feature do
  scenario "a post has a a username" do
    user = User.create({email: "test@mail.com", password: "password"})
    post = Post.create(content: "Test Post", user_id: user.id, picture: 'https://pbs.twimg.com/profile_images/3087236754/91e379b7e0006d38ee0526946a38a1ea_400x400.png')
    visit posts_url(as: user)
    within("##{post.id}") {
    expect(text).to have_content("test@mail.com")}
  end
 end
