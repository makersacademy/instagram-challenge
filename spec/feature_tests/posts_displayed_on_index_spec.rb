RSpec.describe "Displaying posts", :type => :feature do
  feature 'index displays list of posts' do
    before do
      create(:post)
    end
    scenario 'the index displays posts added' do
      visit '/'
      expect(page).to have_css("img[src*='cat.jpg']")
      expect(page).to have_content('My Fave Cat')
    end
    scenario 'displays multiple posts' do
      post_two = create(:post, comment: "Post two")
      post_three = create(:post, comment: "Post three")

      visit '/'
      expect(page).to have_css("img[src*='cat.jpg']")
      expect(page).to have_content('My Fave Cat')
      expect(page).to have_content('Post two')
      expect(page).to have_content('Post three')
    end
  end
end
