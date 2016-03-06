require 'rails_helper'

feature 'Index displays a list of posts' do  
  scenario 'the index displays correct created job info' do
    job_one = create(:post, caption: "This is post one")
    job_two = create(:post, caption: "This is the second post")
  
    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='hong_kong']")
  end
end

feature 'Can view individual posts' do
  scenario 'can click and view a single post' do
    post = create(:post)
    visit '/'
    p post.id
    find(:xpath, "//a[contains(@href,'posts/4')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end