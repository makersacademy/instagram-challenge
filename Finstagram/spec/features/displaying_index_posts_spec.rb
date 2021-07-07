require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    post_one = create(:post, caption: "#coffeetime")
    post_two = create(:post, caption: "#lovecoffee")

    visit '/'
    expect(page).to have_content("#coffeetime")
    expect(page).to have_content("#lovecoffee")
    expect(page).to have_css("img[src*='coffee']")
  end
end
