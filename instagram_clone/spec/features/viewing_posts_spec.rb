require 'rails_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    pending('need to get xpath to work')
    sign_up
    create_post
    visit posts_path
    p page.html
    find(:xpath, "//a[contains(@href,'posts/1')]").click

    expect(page.current_path).to eq(post_path(post))
  end
end
