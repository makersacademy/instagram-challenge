require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is the second post")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='weebl.jpg']")
  end
end

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    post = create(:post, caption: "This is post one")

    visit '/'
    find("img[alt='Weebl']").click
    # find(:xpath, "//a[@href='/posts/1']").click
    # my_link = find(:xpath, "//a[contains(@href)]")
    # my_link.click
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
