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



feature 'Viewing a single post' do
  scenario 'can view a single post when clicked' do
    post = create(:post)

    visit '/'
    my_link = find(:xpath, "//a[contains(@href,'posts/1')]")
    my_link.click
    expect(current_path).to eq(post_path(post))
  end
end
