feature 'Comments' do
  context 'Users can leave comments' do
    scenario 'Users can leave comments on any post' do
      visit '/'
      user_sign_up
      create_new_post
      visit '/'
      click_link 'Comment'
      fill_in 'comment_comment', with: 'Love this photo'
      click_button 'Create Comment'
      visit '/'
      expect(page).to have_content 'Love this photo'
    end
  end
end
