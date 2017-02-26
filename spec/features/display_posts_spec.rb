require 'rails_helper'

feature 'Displaying posts works' do
  scenario 'via an index on the homepage' do
    post_one = create(:post, caption: "My first post")
    post_two = create(:post, caption: "And my second")
    visit '/'
    expect(page).to have_content("My first post")
    expect(page).to have_content("And my second")
    expect(page).to have_css("img[src*='sample_02']")
  end
end
