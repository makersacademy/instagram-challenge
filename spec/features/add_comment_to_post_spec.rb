require "rails_helper"


RSpec.feature 'Comment', type: :feature do
  scenario "Comments can be added to posts" do
    user = User.create({email: "test@mail.com", password: "password"})
    post = Post.create(content: "Test Post", user_id: user.id, picture: 'hello.jpg')
    visit posts_url(as: user)
    click_link('Show')
      fill_in('Body', :with => 'Test Comment')
      click_button('Submit')
      expect(text).to have_content("Test Comment")
  end
 end
