require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct posts' do
    post_one = create(:post, caption: "one")
    post_two = create(:post, caption: "two")

    visit '/'
    expect(page).to have_content("one")
    expect(page).to have_content("two")
    expect(page).to have_css("img[src*='ArmyRyan']")
  end
end
