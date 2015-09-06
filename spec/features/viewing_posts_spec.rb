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
    # job_one = create(:post, caption: "First post")

    visit '/'
    # expect(page).to have_content("First post")
    # click_link ''
    # find(".img-responsive").click
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    # my_link = find(:xpath, "//a[contains(@href,'posts/1')]")
    # my_link.click
    find(:xpath, "//a/img[@alt='Monkey']/..").click
    expect(current_path).to eq(post_path(post))
  end

end
