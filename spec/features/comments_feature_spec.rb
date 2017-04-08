feature 'Comments' do
  context 'Users can leave comments' do

    before(:each) do
      visit '/'
      user_sign_up
      create_new_post
    end

    scenario 'Users can leave comments on any post' do
      visit '/'
      click_link 'Comment'
      fill_in 'comment_comment', with: 'Love this photo'
      click_button 'Create Comment'
      visit '/'
      expect(page).to have_content 'Love this photo'
    end

    scenario 'Usernames are shown with a user comment' do
      visit '/'
      click_link 'Comment'
      fill_in 'comment_comment', with: 'Love this photo'
      click_button 'Create Comment'
      visit '/'
      click_link 'Sign Out'
      second_user_sign_up
      visit '/'
      expect(page).to have_content 'Love this photo'
      expect(page).to have_content 'test1'
    end
  end
end
