require 'rails_helper'

feature 'index displays a list of posts' do
  scenario 'index displays the correct information for each post' do
      post1 = create(:post, caption: "Post one")
      post2 = create(:post, caption: "Post two")

      visit '/'
      expect(page).to have_content("Post one")
      expect(page).to have_content("Post two")
      expect(page).to have_css("img[src*='robocop']")
  end
end
