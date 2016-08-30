require 'rails_helper'

feature 'Displaying posts' do
  background do
    user = create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'mr_deadpool@marvel.com'
    fill_in 'Password', with: 'chimichanga'
    click_button 'Log in'
  end
  
  scenario "the index displays correct created posts/jobs" do
    job_one = create(:post, caption: "This is post #1")
    job_two = create(:post, caption: "This is post #2")

    visit '/'
    expect(page).to have_content "This is post #1"
    expect(page).to have_content "This is post #2"
    expect(page).to have_css "img[src*='cat']"
  end

  scenario "can view individual posts" do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    expect(current_path).to eq post_path(post)
  end
end
