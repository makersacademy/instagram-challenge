require 'rails_helper'

feature 'Viewing multiple posts on index' do
  scenario 'index shows me the right post information' do
    job_one = create(:post, caption: "First post")
    job_two = create(:post, caption: "Second post")

    visit '/'
    expect(page).to have_content("First post")
    expect(page).to have_content("Second post")
    expect(page).to have_css("img[src*='monkey']")
  end
end
