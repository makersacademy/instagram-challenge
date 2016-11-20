require 'rails_helper'

feature 'Index page displays all posts' do
  scenario 'has more than 1 post' do
    post_one = create(:post, caption: "First post")
    post_two = create(:post, caption: "Second post")
    visit '/'
    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
    expect(page).to have_css("img[src*='messier']")
  end
end
