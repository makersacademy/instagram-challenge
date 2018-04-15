require 'rails_helper'
require 'spec_helper'

feature 'Displaying an individual post' do
  background do
    user = create :user
    post = create(:post)

    sign_in_with user
  end

  scenario 'click and view single post' do
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    expect(page.current_path).to eq(post_path(:id))
  end

end
