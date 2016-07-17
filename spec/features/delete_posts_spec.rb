require 'rails_helper'

feature 'Deleting posts' do

  before do
    post = create(:post, caption: 'Abs for days.')
    sign_in
  end

  scenario 'can delete a post' do
    find(:xpath, "(//a[contains(@href,'posts/2')])[1]").click
    click_link 'Delete Post'
    expect(page).to have_content 'Post deleted'
    expect(page).not_to have_content 'Abs for days'
  end

end
