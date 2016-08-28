require 'rails_helper'

feature 'Displaying posts' do
  scenario "the index displays correct created posts/jobs" do
    job_one = create(:post, caption: "This is post #1")
    job_two = create(:post, caption: "This is post #2")

    visit '/'
    expect(page).to have_content "This is post #1"
    expect(page).to have_content "This is post #2"
    expect(page).to have_css "img[src*='cat']"
  end

  scenario "can view indivisual posts" do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq post_path(post)
  end
end
