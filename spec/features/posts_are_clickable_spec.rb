require 'rails_helper'

feature 'Individual Post Page' do
  scenario 'can click on a post and see it alone' do
    newpost1
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
