require 'rails_helper'

feature 'Displaying posts works' do
  scenario 'via index on the homepage' do
    post_one = create(:post, caption: "My first post")
    post_two = create(:post, caption: "And my second")
    visit '/'
    expect(page).to have_content("My first post")
    expect(page).to have_content("And my second")
    expect(page).to have_css("img[src*='sample_02']")
  end

  scenario 'or via individual post pages linked from index.' do
    post = create(:post)
    visit '/'
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    find(:xpath, "//a/img[@alt='Sample 02']/..").click
    expect(page.current_path).to eq(post_path(post))
  end
end
