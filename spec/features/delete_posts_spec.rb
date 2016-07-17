require 'rails_helper'

feature 'Deleting posts' do
  context 'having already added a post' do
    scenario 'can delete a post' do
      sign_in
      add_post
      find(:xpath, "(//a[contains(@href,'posts/2')])[1]").click
      click_link 'Delete Post'
      expect(page).to have_content 'Post deleted'
      expect(page).not_to have_content 'Abs for days'
    end
  end
end
