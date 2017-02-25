feature 'Comment' do
  context 'user is not logged in' do
    scenario 'user cannot comment' do
      sign_up
      create_post
      sign_out
      visit '/posts'
      expect(page).to have_content 'No comments yet...'
      expect(page).not_to have_button 'Create Comment'
    end
  end
  context 'user is logged in' do
    scenario 'posts with no comments display the message "no comments yet"' do
      sign_up
      create_post
      visit '/posts'
      expect(page).to have_content 'No comments yet...'
      expect(page).to have_button 'Create Comment'
    end
    scenario 'user can comment on a post' do
      sign_up
      create_post
      expect{create_comment}.to change{Comment.count}.by(1)
    end
    scenario 'user can view comments' do
      sign_up
      create_post
      create_comment
      expect(page).to have_content 'I love them too! Where can I get these???'
    end
  end
end
