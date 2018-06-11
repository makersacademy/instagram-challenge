require 'rails_helper.rb'

describe 'Deleting posts' do
  before(:each) do
    post_one = create(:post, caption: "This is a sample post")

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  feature 'Deleting a post' do
    scenario 'can delete a post they no longer want displayed' do
      click_link 'Delete Post'
      expect(page).to have_content('Post deleted')
      expect(page).not_to have_content("This is a sample post")
    end
  end
end
