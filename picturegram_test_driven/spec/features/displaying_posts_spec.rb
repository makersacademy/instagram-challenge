require 'rails_helper'

feature 'Index displays a list of posts' do
  background do
    user = create(:user)
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is the second post")
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'jillygates@outlook.com'
    fill_in 'Password', with: 'dotcom'
    click_button 'Log in'
  end
  scenario 'the index displays correct created posts information' do
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='cat']")
  end
  # scenario 'Can click and view a single post' do
  #   post = create(:post, caption: "This is my original post.")
  #   find("a[href='#{post_path(post)}']").click
  #   expect(page.current_path).to eq(post_path(post))
  # end
end

feature 'Index does not display a list of posts' do
  scenario 'It does not display a list of posts to users who are not logged in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
