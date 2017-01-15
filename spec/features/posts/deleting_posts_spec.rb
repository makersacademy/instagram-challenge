require 'rails_helper'

feature 'deleting posts' do

  let(:user1) { create(:user) }
  let(:user2) { create(:user, username: "test_username_2",
                               email: "test2@mail.com",
                               id: '56' ) }
  # scenario 'deleting a post' dor
  #   visit '/posts/1'
  #   click_link 'delete post'
  #   expect(page.current_path).to eq '/'
  #   expect(page).not_to have_content 'My breakfast'
  # end

  context 'user can only delete their own posts' do

    before do
      login_as(user2, :scope => :user)
      user2_post = create(:post, caption: "Burrito", user_id: user2.id)
      logout(:user2)
      login_as(user1, :scope => :user)
      user1_post = create(:post, caption: "My breakfast", user_id: user1.id)
    end

    scenario "user1 can not delete user2's post" do
      visit '/posts/1'
      expect(page).to have_content 'Burrito'
      click_link 'delete post'
      expect(page).to have_content 'Post cannot be deleted. You did not create it.'
    end

    scenario "user1 can delete their own post" do
      visit '/posts/2'
      expect(page).to have_content 'My breakfast'
      click_link 'delete post'
      expect(page.current_path).to eq '/'
      expect(page).not_to have_content 'My breakfast'
      expect(page).to have_content 'Your post has been deleted'
    end

  end

end
