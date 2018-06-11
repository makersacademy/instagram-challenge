require 'rails_helper'

describe 'Displaying posts' do

  feature 'Index displays a list of posts' do
    scenario 'the index displays the correct created post info' do
      post_one = create(:post, caption: "This is post one")
      post_two = create(:post, caption: "This is the second post")

      visit '/'
      expect(page).to have_content("This is post one")
      expect(page).to have_content("This is the second post")
      expect(page).to have_css("img[src*='dog']")
    end

    scenario 'each post has a link to take you to that post' do
      post_one = create(:post, caption: "This is post one")

      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      expect(page).to have_content("This is post one")
      expect(page).to have_css("img[src*='dog']")
    end
  end
end
