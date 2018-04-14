require 'rails_helper'

feature 'Displaying an individual post' do
  scenario 'Click and view single post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    expect(page.current_path).to eq(post_path(post))
  end

end
