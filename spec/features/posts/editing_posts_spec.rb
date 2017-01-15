require 'rails_helper'

feature 'editing posts' do

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

  context 'user can only edit their own posts' do

    before do
      login_as(user2, :scope => :user)
      user2_post = create(:post, caption: "Burrito", user_id: user2.id)
      logout(:user2)
      login_as(user1, :scope => :user)
      user1_post = create(:post, caption: "My breakfast", user_id: user1.id)
    end

    scenario "user1 can not edit user2's post" do
      visit '/posts/1'
      expect(page).to have_content 'Burrito'
      click_link 'edit post'
      fill_in 'Caption', with: 'YOLO'
      click_button 'save changes'
      expect(page).to have_content 'You cannot edit a post you did not create'
    end

    scenario "user1 can edit their own post" do
      visit '/posts/2'
      expect(page).to have_content 'My breakfast'
      click_link 'edit post'
      fill_in 'Caption', with: 'YOLO'
      click_button 'save changes'
      expect(page.current_path).to eq '/'
      expect(page).not_to have_content 'My breakfast'
      expect(page).to have_content 'Thanks. Your changes have been saved.'
      expect(page).to have_content 'YOLO'
    end

  end

end
