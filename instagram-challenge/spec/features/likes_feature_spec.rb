require 'rails_helper'

feature 'Likes' do
  before do
    user = User.create({email: "test@test.com", password: 'testingstuff'})
    post = Post.create({description: "Image", user: user})
  end

  scenario "A user can like a post, which updates the like counter", js:true do
    visit '/posts'
    find(".like").click
    expect(page).to have_content "1 like"
  end

end
