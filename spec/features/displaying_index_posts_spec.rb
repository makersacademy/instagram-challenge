require 'rails_helper'

feature 'Index displays a list of posts' do  
  scenario 'the index displays correct created post information' do
    user = create(:user)
    signin 
    post_one = create(:post, caption: "This is post one", user: user)
    post_two = create(:post, caption: "This is the second post", user: user)
    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='sunset']")
  end
end
