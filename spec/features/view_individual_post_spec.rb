# frozen_string_literal: true

require "rails_helper"

feature "Viewing individual posts" do
  scenario "Can click post and view just that post" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    sign_in user
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :prefer_exact).click
    expect(page.current_path).to eq(post_path(post))
  end
end
