feature 'Like' do
  context 'user is not logged in' do
    scenario 'user cannot like a post' do
      sign_up
      create_post
      sign_out
      visit '/posts'
      expect(page).to have_content '0 likes'
      expect(page).not_to have_link "like-post-#{Post.first.id}"
    end
  end
  context 'user is logged in' do
    scenario 'posts with no likes display the message "0 likes"' do
      sign_up
      create_post
      visit '/posts'
      expect(page).to have_content '0 likes'
      expect(page).to have_link "like-post-#{Post.first.id}"
    end
    scenario 'user can like a post' do
      sign_up
      create_post
      expect{create_like}.to change{Post.first.get_upvotes.size}.by(1)
    end
    scenario 'user can see amount of likes on a post' do
      sign_up
      create_post
      create_like
      expect(page).to have_content '1 like'
    end
  end
end
