RSpec.describe "Creating comments", :type => :feature do
  before() do
    @post = create(:post)
  end
  feature 'Adding a comment' do
    scenario 'can add comment to a post' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      fill_in 'comment[body]', with: 'Cool cat'
      click_button 'Create Comment'
      expect(page).to have_content "Cool cat"
    end
  end
end
