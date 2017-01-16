require 'rails_helper'

feature 'posts' do

  let(:user) { create(:user) }
  
  context 'no posts have been added' do
    before do
      login_as(user, :scope => :user)
    end
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New post'
    end
  end

  context 'posts have been added' do
    before do
      login_as(user, :scope => :user)
      new_post = create(:post, caption: "My breakfast", user_id: user.id)
    end

    scenario 'posts are displayed' do
      visit '/posts'
      expect(page).to have_content "My breakfast"
    end

    scenario 'viewing an individual post' do
      visit '/posts'
      click_link 'image-1'
    end
  end

end
