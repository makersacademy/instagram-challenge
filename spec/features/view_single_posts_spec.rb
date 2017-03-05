require 'rails_helper'

feature 'Viewing a single post works' do
  scenario 'via individual post pages linked from index.' do
    user = create(:user)
    post = create(:post)
    sign_in_with user
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    find(:xpath, "//a/img[@alt='Sample 02']/..").click
    expect(page.current_path).to eq(post_path(post))
  end
end
