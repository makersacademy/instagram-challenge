require 'rails_helper'

feature 'view a single post' do
  before do

  end

  context 'User creates post' do
    scenario 'lets a user view a single post' do
      user = create :user
      post = FactoryGirl.create(:post, user: user, id: 600)
      sign_up
      visit '/posts'
      find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
      expect(page).to have_content 'google logo'
      expect(page.current_path).to eq(post_path(post))
      expect(page).to have_css("img[src*='googlelogo.png']")
    end
  end
end