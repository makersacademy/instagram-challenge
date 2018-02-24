RSpec.describe "User can add post", :type => :feature do
  feature 'Can add post' do
    scenario "User navigates to page and option to add post available" do
      visit '/'
      expect(page).to have_content('Welcome to Fakestagram')
    end
  end
end
