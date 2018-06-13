require 'rails_helper'

describe 'Displaying posts' do

  feature 'Index displays a list of posts' do
    before(:each) do
      user = create(:user, email: 'send@email.com', password: 'password1')
      post_one = create(:post, caption: "This is post one")

      visit '/'
      click_link 'Login'
      fill_in 'Email', with: 'send@email.com'
      fill_in 'Password', with: 'password1'
      click_button 'Log in'
    end


    scenario 'the index displays the correct created post info' do

      expect(page).to have_content("This is post one")
      expect(page).to have_css("img[src*='dog']")
    end

    scenario 'each post has a link to take you to that post' do

      find(:xpath, "//a[contains(@href,'posts/1')]").click
      expect(page).to have_content("This is post one")
      expect(page).to have_css("img[src*='dog']")
    end
  end
end
