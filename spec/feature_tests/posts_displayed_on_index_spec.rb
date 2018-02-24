RSpec.describe "Displaying posts", :type => :feature do
  before(:each) do
    @post = create(:post)
  end

  feature 'index displays list of posts' do
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
  
  feature 'can view individual posts' do
    scenario 'click on post' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/5')]").click
      expect(page.current_path).to eq(post_path(@post))
    end
  end
end
