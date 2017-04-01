feature 'Comment' do
  context 'user is not logged in' do
    scenario 'user cannot comment' do
      sign_up
      create_post
      sign_out
      visit '/posts'
      expect(page).not_to have_button 'Comment'
    end
  end
  context 'user is logged in' do
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
