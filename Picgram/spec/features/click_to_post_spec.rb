require 'rails_helper'

feature 'View single post' do
  scenario 'click on image and view single post' do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
