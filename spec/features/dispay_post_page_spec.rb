require 'rails_helper'

feature 'Pictures are selectable' do
  scenario 'when user selects a picture it redirects you to its post page' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
