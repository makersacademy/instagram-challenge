require 'rails_helper'

feature 'Viewing individual posts' do
  scenario 'Can click post and view just that post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
