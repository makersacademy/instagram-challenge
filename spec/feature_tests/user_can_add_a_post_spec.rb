RSpec.describe "Creating posts", :type => :feature do
  feature 'Add post' do
    scenario "User adds a post and post is displayed" do
      visit '/'
      click_link 'Add post'
      fill_in 'post[comment]', with: 'My fave cat'
      attach_file 'post[avatar]', Rails.root.join('spec/images/cat.jpg')
      click_button 'Create Post'
      expect(page).to have_css("img[src*='cat.jpg']")
      expect(page).to have_content('My fave cat')
    end
  end
end
