RSpec.describe "Creating posts", :type => :feature do

  before(:all) do
    @post = create(:post)
  end

  feature 'Editing posts' do
    scenario 'can edit a post' do

      visit '/'
      expect(page).to have_content("My Fave Cat")

      find(:xpath, "//a[contains(@href,'posts/7')]").click
      click_link 'Update post'

      fill_in 'post[comment]', with: 'Not my fave cat'
      click_button 'Update Post'
      expect(page).to have_content("Sorted it 4 u hun")
      expect(page).to have_content("Not my fave cat")
      expect(page).not_to have_content("My Fave Cat")
    end
  end
end
