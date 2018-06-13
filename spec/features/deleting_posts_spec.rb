require 'rails_helper.rb'

describe 'Deleting posts' do
  before(:each) do
    user = create(:user, email: 'testing@yahoo.co.uk', password: 'password1')
    post_one = create(:post, caption: "This is a sample post")

    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'testing@yahoo.co.uk'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
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
