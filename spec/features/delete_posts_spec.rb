require 'rails_helper'

feature 'Deleting posts' do

  before do
    post = create(:post, caption: 'Abs for days.')
    visit '/'
    find(:xpath, "(//a[contains(@href,'posts/2')])[1]").click
  end

  scenario 'can delete a post' do
    click_link 'Delete Post'
    expect(page).to have_content 'Post deleted'
    expect(page).not_to have_content 'Abs for days'
  end

end
